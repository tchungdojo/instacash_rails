class LendersController < ApplicationController
	def create
		lender = Lender.new(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			password: params[:password],
			money: params[:money]
			)
		if lender.invalid?
			flash[:errors] = lender.errors.full_messages
			redirect_to '/sessions/new'
		else
			lender.save
			session[:lender_id] = lender.id
			redirect_to "/lenders/#{lender.id}"
		end
	end
	def show
		@borrowers = Borrower.all
		@lent = Lender.find(current_lender.id).histories
	end





end