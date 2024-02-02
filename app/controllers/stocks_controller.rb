class StocksController < ApplicationController
    def search
      if params[:stock].present?
        @stock = Stock.new_lookup(params[:stock])
        if @stock
          render partial: 'users/result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], stock: @stock }                                        
        else
          flash.now[:alert] = "Please enter a valid symbol"
          render_error_message
        end
      else
        flash.now[:alert] = "Please enter a symbol"
        render_error_message
      end
    end
  
    private
  
    def render_error_message
      render partial: 'users/result', locals: { notice: flash.now[:notice], alert: flash.now[:alert], stock: @stock }
    end
end
