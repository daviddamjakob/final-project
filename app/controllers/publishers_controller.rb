class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all

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
