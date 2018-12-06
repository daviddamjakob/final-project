class ArticlesController < ApplicationController
  def index
    @articles = Article.all

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
    @article.caption = params.fetch("caption")
    @article.reading_time = params.fetch("reading_time")
    @article.user_id = params.fetch("user_id")
    
    if link.present?
      begin
        require "net/http"
        url = URI.parse(link)
        req = Net::HTTP.new(url.host, url.port)
        res = req.request_head(url.path)
      rescue
        link = ""
      else
        if res.code != 200
          link = ""
        end
      end
    end
    
    if link.present?
    
      skip_author = false
      author = Bateman::TwitterCard.new(link).creator
      if author.blank?
        skip_author = true
      elsif Author.where(:name => author).exists?
        # do nothing
      else
        author_new = Author.new
        author_new.name = author
        author_new.save
      end
      
      skip_publisher = false
      publisher = Bateman::TwitterCard.new(link).site
      if publisher.blank?
        skip_publisher = true
      elsif Publisher.where(:name => publisher).exists?
        # do nothing
      else
        publisher_new = Publisher.new
        publisher_new.name = publisher
        publisher_new.save
      end
      

      @article.link = link
      if skip_author == false
        @article.author_id = Author.where(:name => author)[0].id
      end
      if skip_publisher == false
        @article.publisher_id = Publisher.where(:name => publisher)[0].id
      end
  
      @article.tc_image = Bateman::TwitterCard.new(link).image
      # there are four different card options: summary, summary_large_image, player and app
      # summary has no image, player is a video link, app links an app (not essential here)
      # Youtube videos work with iFrame, other videos with video tag
      @article.tc_card = Bateman::TwitterCard.new(link).card
      @article.tc_title = Bateman::TwitterCard.new(link).title
      @article.tc_description = Bateman::TwitterCard.new(link).description
      
    end


    if @article.valid?
      @article.save

      redirect_back(:fallback_location => "/articles", :notice => "Article created successfully.")
    else
      render("article_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @article = Article.find(params.fetch("prefill_with_id"))

    render("article_templates/edit_form.html.erb")
  end

  def update_row
    @article = Article.find(params.fetch("id_to_modify"))

    @article.link = params.fetch("link")
    @article.caption = params.fetch("caption")
    @article.reading_time = params.fetch("reading_time")
    @article.user_id = params.fetch("user_id")
    @article.author_id = params.fetch("author_id")
    @article.publisher_id = params.fetch("publisher_id")

    if @article.valid?
      @article.save

      redirect_to("/articles/#{@article.id}", :notice => "Article updated successfully.")
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
