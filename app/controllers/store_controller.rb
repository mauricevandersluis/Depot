class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def increment_counter
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
  end
  def index
    @counter = increment_counter
    @count_message = "visited #{@counter} time(s)" #if session[:counter] > 5
    @products = Product.order(:title)
    @time = Time.now.strftime('%d-%m-%Y %H:%M')
  end
end
