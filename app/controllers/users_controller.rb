class UsersController < ApplicationController
   
   def index
      
      @users = User.all
      
      render("users/index")
   end
   
   
   def show
       
       @user_profile = User.find(params.fetch("id_to_display"))
       @posts = @user_profile.articles
       
       render("users/show")
   end
   
   
   def feedback
   
      render("users/feedback")
   end
    
end