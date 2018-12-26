Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  authenticated :user do
    root 'articles#index', as: 'authenticated_root'
    
    # Routes for the Publisher resource:

  # CREATE
  get("/publishers/new", { :controller => "publishers", :action => "new_form" })
  post("/create_publisher", { :controller => "publishers", :action => "create_row" })

  # READ
  get("/publishers", { :controller => "publishers", :action => "index" })
  get("/publishers/:id_to_display", { :controller => "publishers", :action => "show" })

  # UPDATE
  get("/publishers/:prefill_with_id/edit", { :controller => "publishers", :action => "edit_form" })
  post("/update_publisher/:id_to_modify", { :controller => "publishers", :action => "update_row" })

  # DELETE
  get("/delete_publisher/:id_to_remove", { :controller => "publishers", :action => "destroy_row" })

  #------------------------------

  # Routes for the Author resource:

  # CREATE
  get("/authors/new", { :controller => "authors", :action => "new_form" })
  post("/create_author", { :controller => "authors", :action => "create_row" })

  # READ
  get("/authors", { :controller => "authors", :action => "index" })
  get("/authors/:id_to_display", { :controller => "authors", :action => "show" })

  # UPDATE
  get("/authors/:prefill_with_id/edit", { :controller => "authors", :action => "edit_form" })
  post("/update_author/:id_to_modify", { :controller => "authors", :action => "update_row" })

  # DELETE
  get("/delete_author/:id_to_remove", { :controller => "authors", :action => "destroy_row" })

  #------------------------------

  # Routes for the Description resource:

  # CREATE
  get("/descriptions/new", { :controller => "descriptions", :action => "new_form" })
  post("/create_description", { :controller => "descriptions", :action => "create_row" })

  # READ
  get("/descriptions", { :controller => "descriptions", :action => "index" })
  get("/descriptions/:id_to_display", { :controller => "descriptions", :action => "show" })

  # UPDATE
  get("/descriptions/:prefill_with_id/edit", { :controller => "descriptions", :action => "edit_form" })
  post("/update_description/:id_to_modify", { :controller => "descriptions", :action => "update_row" })

  # DELETE
  get("/delete_description/:id_to_remove", { :controller => "descriptions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Hashtag resource:

  # CREATE
  get("/hashtags/new", { :controller => "hashtags", :action => "new_form" })
  post("/create_hashtag", { :controller => "hashtags", :action => "create_row" })

  # READ
  get("/hashtags", { :controller => "hashtags", :action => "index" })
  get("/hashtags/:id_to_display", { :controller => "hashtags", :action => "show" })

  # UPDATE
  get("/hashtags/:prefill_with_id/edit", { :controller => "hashtags", :action => "edit_form" })
  post("/update_hashtag/:id_to_modify", { :controller => "hashtags", :action => "update_row" })

  # DELETE
  get("/delete_hashtag/:id_to_remove", { :controller => "hashtags", :action => "destroy_row" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  get("/favorites/new", { :controller => "favorites", :action => "new_form" })
  post("/create_favorite", { :controller => "favorites", :action => "create_row" })

  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  get("/favorites/:id_to_display", { :controller => "favorites", :action => "show" })

  # UPDATE
  get("/favorites/:prefill_with_id/edit", { :controller => "favorites", :action => "edit_form" })
  post("/update_favorite/:id_to_modify", { :controller => "favorites", :action => "update_row" })

  # DELETE
  get("/delete_favorite/:id_to_remove", { :controller => "favorites", :action => "destroy_row" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  get("/bookmarks/new", { :controller => "bookmarks", :action => "new_form" })
  post("/create_bookmark", { :controller => "bookmarks", :action => "create_row" })

  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  get("/bookmarks/:id_to_display", { :controller => "bookmarks", :action => "show" })

  # UPDATE
  get("/bookmarks/:prefill_with_id/edit", { :controller => "bookmarks", :action => "edit_form" })
  post("/update_bookmark/:id_to_modify", { :controller => "bookmarks", :action => "update_row" })

  # DELETE
  get("/delete_bookmark/:id_to_remove", { :controller => "bookmarks", :action => "destroy_row" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  get("/comments/new", { :controller => "comments", :action => "new_form" })
  post("/create_comment", { :controller => "comments", :action => "create_row" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  get("/comments/:id_to_display", { :controller => "comments", :action => "show" })

  # UPDATE
  get("/comments/:prefill_with_id/edit", { :controller => "comments", :action => "edit_form" })
  post("/update_comment/:id_to_modify", { :controller => "comments", :action => "update_row" })

  # DELETE
  get("/delete_comment/:id_to_remove", { :controller => "comments", :action => "destroy_row" })

  #------------------------------

  # Routes for the Rating resource:

  # CREATE
  get("/ratings/new", { :controller => "ratings", :action => "new_form" })
  post("/create_rating", { :controller => "ratings", :action => "create_row" })

  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  get("/ratings/:id_to_display", { :controller => "ratings", :action => "show" })

  # UPDATE
  get("/ratings/:prefill_with_id/edit", { :controller => "ratings", :action => "edit_form" })
  post("/update_rating/:id_to_modify", { :controller => "ratings", :action => "update_row" })

  # DELETE
  get("/delete_rating/:id_to_remove", { :controller => "ratings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Article resource:

  # CREATE
  get("/articles/new", { :controller => "articles", :action => "new_form" })
  post("/create_article", { :controller => "articles", :action => "create_row" })

  # READ
  get("/articles", { :controller => "articles", :action => "index" })
  get("/articles/:id_to_display", { :controller => "articles", :action => "show" })

  # UPDATE
  get("/articles/:prefill_with_id/edit", { :controller => "articles", :action => "edit_form" })
  post("/update_article/:id_to_modify", { :controller => "articles", :action => "update_row" })

  # DELETE
  get("/delete_article/:id_to_remove", { :controller => "articles", :action => "destroy_row" })

  #------------------------------
  
  # Routes for users

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  end
  
  devise_scope :user do
    root 'devise/sessions#new'
  end
  
  
  
end
