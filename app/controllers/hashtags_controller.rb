class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all

    render("hashtag_templates/index.html.erb")
  end

  def show
    @hashtag = Hashtag.find(params.fetch("id_to_display"))

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
