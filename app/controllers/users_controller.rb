class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end
  def my_friends
    @friends = current_user.friends
  end
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      if @friends
        render partial: 'users/friend_result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], friend: @friend }
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
      render partial: 'users/friend_result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], friend: @friend }
    end
end
