class DescriptionsController < ApplicationController
  def index
    @descriptions = Description.all

    render("description_templates/index.html.erb")
  end

  def show
    @description = Description.find(params.fetch("id_to_display"))

    render("description_templates/show.html.erb")
  end

  def new_form
    @description = Description.new

    render("description_templates/new_form.html.erb")
  end

  def create_row
    @description = Description.new

    @description.hashtag_id = params.fetch("hashtag_id")
    @description.article_id = params.fetch("article_id")

    if @description.valid?
      @description.save

      redirect_back(:fallback_location => "/descriptions", :notice => "Description created successfully.")
    else
      render("description_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @description = Description.find(params.fetch("prefill_with_id"))

    render("description_templates/edit_form.html.erb")
  end

  def update_row
    @description = Description.find(params.fetch("id_to_modify"))

    @description.hashtag_id = params.fetch("hashtag_id")
    @description.article_id = params.fetch("article_id")

    if @description.valid?
      @description.save

      redirect_to("/descriptions/#{@description.id}", :notice => "Description updated successfully.")
    else
      render("description_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @description = Description.find(params.fetch("id_to_remove"))

    @description.destroy

    redirect_to("/descriptions", :notice => "Description deleted successfully.")
  end
end
