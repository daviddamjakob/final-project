class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all

    render("feedback_templates/index.html.erb")
  end

  def show
    @feedback = Feedback.find(params.fetch("id_to_display"))

    render("feedback_templates/show.html.erb")
  end

  def new_form
    @feedback = Feedback.new

    render("feedback_templates/new_form.html.erb")
  end

  def create_row
    @feedback = Feedback.new

    @feedback.topic = params.fetch("topic")
    @feedback.pagination = params.fetch("pagination")
    @feedback.description = params.fetch("description")
    @feedback.user_id = params.fetch("user_id")
    @feedback.status = params.fetch("status")

    if @feedback.valid?
      @feedback.save

      redirect_back(:fallback_location => "/feedback/new", :notice => "Feedback created successfully.")
    else
      render("feedback_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @feedback = Feedback.find(params.fetch("prefill_with_id"))

    render("feedback_templates/edit_form.html.erb")
  end

  def update_row
    @feedback = Feedback.find(params.fetch("id_to_modify"))

    @feedback.topic = params.fetch("topic")
    @feedback.pagination = params.fetch("pagination")
    @feedback.description = params.fetch("description")
    @feedback.user_id = params.fetch("user_id")
    @feedback.status = params.fetch("status")

    if @feedback.valid?
      @feedback.save

      redirect_to("/feedbacks", :notice => "Feedback updated successfully.")
    else
      render("feedback_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @feedback = Feedback.find(params.fetch("id_to_remove"))

    @feedback.destroy

    redirect_to("/feedbacks", :notice => "Feedback deleted successfully.")
  end
end
