class AuthorsController < ApplicationController
  def index
    authors = Author.all
    
    focus = []
    
    authors.each do |author|
      
      author_rating_total = 0
      author_rated_total = 0
      author.articles.each do |article|
        ratings_count = article.ratings.count
        if ratings_count > 0
          sum=0
          article.ratings.each do |i|
           sum += i.score
          end
          rating_avg = sum / ratings_count
          author_rating_total += rating_avg
          author_rated_total += 1
        else
          rating_avg = 0
        end
      end
      if author_rated_total == 0
        author_rating = 0
      else
        author_rating = author_rating_total / author_rated_total
      end
       
       hash = {:id => author.id, :name => author.name, :rating => author_rating, :articles_count => author.articles.count}
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

    render("author_templates/index.html.erb")
  end

  def show
    @author = Author.find(params.fetch("id_to_display"))
    @articles = @author.articles

    render("author_templates/show.html.erb")
  end

  def new_form
    @author = Author.new

    render("author_templates/new_form.html.erb")
  end

  def create_row
    @author = Author.new

    @author.name = params.fetch("name")

    if @author.valid?
      @author.save

      redirect_back(:fallback_location => "/authors", :notice => "Author created successfully.")
    else
      render("author_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @author = Author.find(params.fetch("prefill_with_id"))

    render("author_templates/edit_form.html.erb")
  end

  def update_row
    @author = Author.find(params.fetch("id_to_modify"))

    @author.name = params.fetch("name")

    if @author.valid?
      @author.save

      redirect_to("/authors/#{@author.id}", :notice => "Author updated successfully.")
    else
      render("author_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @author = Author.find(params.fetch("id_to_remove"))

    @author.destroy

    redirect_to("/authors", :notice => "Author deleted successfully.")
  end
end
