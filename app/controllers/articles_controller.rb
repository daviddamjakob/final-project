class ArticlesController < ApplicationController
  
  
  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(:distinct => true).includes(:tags)

    render("article_templates/index.html.erb")
  end

  def show
    @article = Article.find(params.fetch("id_to_display"))

    render("article_templates/show.html.erb")
  end

  def new_form
    @article = Article.new

    render("article_templates/new_form.html.erb")
  end

  def create_row
    
    link = params.fetch("link")
    
    @article = Article.new
    @article.link = link
    @article.caption = params.fetch("caption")
    @article.reading_time = params.fetch("reading_time")
    @article.private_status = params.fetch("private_status")
    @article.user_id = params.fetch("user_id")
    
    @article.hashtags_input = params.fetch("hashtags")
    
    
    if @article.valid?
      
      # link to Github of Twittercard -> https://github.com/geoffharcourt/bateman
      # add variables to table that require valid url
      @article.tc_image = Bateman::TwitterCard.new(link).image
      # there are four different card options: summary, summary_large_image, player and app
      # summary has no image, player is a video link, app links an app (not essential here)
      # Youtube videos work with iFrame, other videos with video tag
      @article.tc_card = Bateman::TwitterCard.new(link).card
      @article.tc_title = Bateman::TwitterCard.new(link).title
      @article.tc_description = Bateman::TwitterCard.new(link).description
      
      # add author to database
      author = Bateman::TwitterCard.new(link).creator
      if author.blank?
      else
        if Author.where(:name => author).blank?
          author_new = Author.new
          author_new.name = author
          author_new.save
        end
        @article.author_id = Author.where(:name => author)[0].id
      end
      
      # add publisher to database
      publisher = Bateman::TwitterCard.new(link).site
      if publisher.blank?
      else
        if Publisher.where(:name => publisher).blank?
          publisher_new = Publisher.new
          publisher_new.name = publisher
          publisher_new.save
        end
        @article.publisher_id = Publisher.where(:name => publisher)[0].id
      end
      
      
      @article.save
      
      # hashtags (have to be placed here because only now there is an article id)
      hashtag_array = @article.hashtags_input.split
      # check whether hashtag starts with #
      # for correct hashtags, check whether tag already exists in table
      # if not, create new entry
      # for correct hashtags, create new entry in description table
      hashtag_array.each do |hashtag|
        if hashtag[0] == "#"
          # create new hashtag entry if necessary
          if Hashtag.where(:tag => hashtag).blank?
            hashtag_new = Hashtag.new
            hashtag_new.tag = hashtag
            hashtag_new.save
          end
          # create new association between hashtag and article
          description_new = Description.new
          description_new.hashtag_id = Hashtag.where(:tag => hashtag)[0].id
          description_new.article_id = @article.id
          description_new.save
        end
      end
      
      
      # cannot use redirect_back because it causes GET error when coming via new_with_errors form
      redirect_to("/articles", :notice => "Article created successfully.")
    
    else
      render("article_templates/new_form_with_errors.html.erb")
    end
      
    
  end

  def edit_form
    @article = Article.find(params.fetch("prefill_with_id"))

    render("article_templates/edit_form.html.erb")
  end

  def update_row
    
    article_id = params.fetch("id_to_modify")
    @article = Article.find(article_id)
    @article.link = params.fetch("link")
    @article.caption = params.fetch("caption")
    @article.reading_time = params.fetch("reading_time")
    @article.user_id = params.fetch("user_id")
    
    @article.hashtags_input = params.fetch("hashtags")
    
    if @article.valid?
      
      # chaning the associated hashtags
      # must be done before saving so old tags can still be read
      hashtags_old = Article.find(article_id).hashtags_input.split
      hashtags_new = @article.hashtags_input.split
      
      hashtags_deleted = hashtags_old - hashtags_new
      hashtags_added = hashtags_new - hashtags_old
      
      # destroy all descriptions rows associated with deleted hashtags for article
      hashtags_deleted.each do |hashtag|
        Description.where(:hashtag_id => Hashtag.where(:tag => hashtag)[0].id, :article_id => article_id)[0].destroy
      end
      
      # add new descriptions rows for new hashtag associations
      # if hashtag does not exist yet, then create it
      hashtags_added.each do |hashtag|
        if Hashtag.where(:tag => hashtag).empty?
          hashtag_new = Hashtag.new
          hashtag_new.tag = hashtag
          hashtag_new.save
        end
        description_new = Description.new
        description_new.article_id = article_id
        description_new.hashtag_id = Hashtag.where(:tag => hashtag)[0].id
        description_new.save
      end
      
      @article.save

      redirect_to("/articles", :notice => "Article updated successfully.")
    else
      render("article_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @article = Article.find(params.fetch("id_to_remove"))

    @article.destroy

    redirect_to("/articles", :notice => "Article deleted successfully.")
  end
end
