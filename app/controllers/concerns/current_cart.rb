module CurrentCart
  extend ActiveSupport::Concern
  private
    def set_cart
      @cart = Cart.find(session[:cart_id])
      if session[:counter].nil?
        @counter = :counter
      end
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
end