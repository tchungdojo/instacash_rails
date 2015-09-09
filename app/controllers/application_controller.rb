class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_lender
    @lender = Lender.find(session[:lender_id]) if session[:lender_id]
  end
  def current_borrower
    @borrower = Borrower.find(session[:borrower_id]) if session[:borrower_id]
  end
  helper_method :current_lender, :current_borrower
end
