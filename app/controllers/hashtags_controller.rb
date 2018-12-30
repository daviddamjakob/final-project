class HashtagsController < ApplicationController
  def index
    hashtags = Hashtag.all
    
    focus = []
    
    hashtags.each do |hashtag|
      
      hashtag_rating_total = 0
      hashtags_rated_total = 0
      hashtag.related_articles.each do |article|
        ratings_count = article.ratings.count
        if ratings_count > 0
          sum=0
          article.ratings.each do |i|
           sum += i.score
          end
          rating_avg = sum / ratings_count
          hashtag_rating_total += rating_avg
          hashtags_rated_total += 1
        else
          rating_avg = 0
        end
      end
      if hashtags_rated_total == 0
        hashtag_rating = 0
      else
        hashtag_rating = hashtag_rating_total / hashtags_rated_total
      end
       
       hash = {:id => hashtag.id, :hashtag => hashtag.tag, :rating => hashtag_rating, :articles_count => hashtag.related_articles.count}
       focus.push(hash)
       
    end
    
    if params[:sort].nil?
      @focus_sorted = focus.sort_by{|hsh| hsh[:articles_count]}.reverse
    else
      if params.fetch("sort") == "rating"
        @focus_sorted = focus.sort_by{|hsh| hsh[:rating]}.reverse
      else
        @focus_sorted = focus.sort_by{|hsh| hsh[:articles_count]}.reverse
      end
    end
    
    
    render("hashtag_templates/index.html.erb")
  end

  def show
    @hashtag = Hashtag.find(params.fetch("id_to_display"))
    @articles = @hashtag.related_articles

    render("hashtag_templates/show.html.erb")
  end

  def new_form
    @hashtag = Hashtag.new

    render("hashtag_templates/new_form.html.erb")
  end

  def create_row
    @hashtag = Hashtag.new

    @hashtag.tag = params.fetch("tag")

    if @hashtag.valid?
      @hashtag.save

      redirect_back(:fallback_location => "/hashtags", :notice => "Hashtag created successfully.")
    else
      render("hashtag_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @hashtag = Hashtag.find(params.fetch("prefill_with_id"))

    render("hashtag_templates/edit_form.html.erb")
  end

  def update_row
    @hashtag = Hashtag.find(params.fetch("id_to_modify"))

    @hashtag.tag = params.fetch("tag")

    if @hashtag.valid?
      @hashtag.save

      redirect_to("/hashtags/#{@hashtag.id}", :notice => "Hashtag updated successfully.")
    else
      render("hashtag_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @hashtag = Hashtag.find(params.fetch("id_to_remove"))

    @hashtag.destroy

    redirect_to("/hashtags", :notice => "Hashtag deleted successfully.")
  end
end
