class PublishersController < ApplicationController
  def index
    publishers = Publisher.all
    
    focus = []
    
    publishers.each do |publisher|
      
      publisher_rating_total = 0
      publisher_rated_total = 0
      publisher.articles.each do |article|
        ratings_count = article.ratings.count
        if ratings_count > 0
          sum=0
          article.ratings.each do |i|
           sum += i.score
          end
          rating_avg = sum / ratings_count
          publisher_rating_total += rating_avg
          publisher_rated_total += 1
        else
          rating_avg = 0
        end
      end
      if publisher_rated_total == 0
        publisher_rating = 0
      else
        publisher_rating = publisher_rating_total / publisher_rated_total
      end
       
       hash = {:id => publisher.id, :name => publisher.name, :rating => publisher_rating, :articles_count => publisher.articles.count}
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

    render("publisher_templates/index.html.erb")
  end

  def show
    @publisher = Publisher.find(params.fetch("id_to_display"))
    @articles = @publisher.articles

    render("publisher_templates/show.html.erb")
  end

  def new_form
    @publisher = Publisher.new

    render("publisher_templates/new_form.html.erb")
  end

  def create_row
    @publisher = Publisher.new

    @publisher.name = params.fetch("name")

    if @publisher.valid?
      @publisher.save

      redirect_back(:fallback_location => "/publishers", :notice => "Publisher created successfully.")
    else
      render("publisher_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @publisher = Publisher.find(params.fetch("prefill_with_id"))

    render("publisher_templates/edit_form.html.erb")
  end

  def update_row
    @publisher = Publisher.find(params.fetch("id_to_modify"))

    @publisher.name = params.fetch("name")

    if @publisher.valid?
      @publisher.save

      redirect_to("/publishers/#{@publisher.id}", :notice => "Publisher updated successfully.")
    else
      render("publisher_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @publisher = Publisher.find(params.fetch("id_to_remove"))

    @publisher.destroy

    redirect_to("/publishers", :notice => "Publisher deleted successfully.")
  end
end
