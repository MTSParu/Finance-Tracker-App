class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
  def my_friends
    @friends = current_user.friends
  end
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        render partial: 'users/friend_result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], friends: @friends }
      else
        flash.now[:alert] = "Friend not found for ticker: #{params[:friend][:ticker]}"
        render_error_message
      end
    else
      flash.now[:alert] = "Please enter a valid symbol"
      render_error_message
    end
  end    
  private
  
    def render_error_message
      render partial: 'users/friend_result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], friend: @friends }
    end
end
