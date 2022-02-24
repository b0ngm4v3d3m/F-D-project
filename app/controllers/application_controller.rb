class ApplicationController < ActionController::Base
  before_action :find_cart

  include SessionsHelper


  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."

      redirect_to login_path
    end
  end

  def current_cart
    return redirect_to login_path unless current_user
    order = Order.find_by(id: session[:cart_id])
    order = current_user.orders.create! unless order
    session[:cart_id] = order.id
    order
  end

  def find_cart
    @cart = current_cart if logged_in?
  end

  helper_method :current_cart
end
