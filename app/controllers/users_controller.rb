class UsersController < ApplicationController
   
   def index
   
   
   end
   
   
   def show
       
       @user_profile = User.find(params.fetch("id_to_display"))
       @posts = @user_profile.articles
       
       render("users/show")
   end
    
end