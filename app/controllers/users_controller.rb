class UsersController < ApplicationController
   
   def index
   
   
   end
   
   
   def show
       
       @q = current_user.articles.ransack(params[:q])
       @posts = @q.result
       
       render("users/show")
   end
    
end