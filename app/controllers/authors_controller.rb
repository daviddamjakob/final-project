class AuthorsController < ApplicationController
  def index
    @authors = Author.all

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
