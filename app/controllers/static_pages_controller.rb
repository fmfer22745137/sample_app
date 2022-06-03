class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end    
  end

  def search
    keyword = params[:keyword]
    all_users = User.where("name LIKE ?", "%#{keyword}%")
    @users = all_users.paginate(page: params[:page], per_page: 5)

    all_microposts = Micropost.where("content LIKE ?", "%#{keyword}%")
    @microposts = all_microposts.paginate(page: params[:page], per_page: 15)
  end

  def help
  end

  def about
  end

  def contact
  end
end
