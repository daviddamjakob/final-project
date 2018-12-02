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
    @article = Article.new

    @article.link = params.fetch("link")
    @article.caption = params.fetch("caption")
    @article.reading_time = params.fetch("reading_time")
    @article.user_id = params.fetch("user_id")
    @article.author_id = params.fetch("author_id")
    @article.publisher_id = params.fetch("publisher_id")

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
