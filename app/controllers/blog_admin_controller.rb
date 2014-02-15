class BlogAdminController < ApplicationController
  
  before_filter :authenticate_user!
  
  def blog_admin
    if current_user
      user = User.find(current_user.id)
      if administrator?(user)
        @posts = Post.all
        @category = Category.new
        render :blog_admin
      else
        flash[:alert] = "Only Administrators can access that page."
        redirect_to root_path
        flash[:alert] = "Only Administrators can access this page."

      end
    else
      redirect_to new_user_session_path
    end
  end

  protected 

  def administrator?(user)
    user.email == "jpluftig@hotmail.com"
  end

end

