class BorrowersController < ApplicationController
	def create
		borrower = Borrower.new(
			first_name: params[:first_name],
			last_name: params[:last_name],
			email: params[:email],
			password: params[:password],
			purpose:  params[:purpose],
			raised: 0,
			description: params[:description],
			money: params[:money]
			)
		if borrower.invalid?
			flash[:errors] = borrower.errors.full_messages
			redirect_to '/sessions/new'
		else
			borrower.save
			session[:borrower_id] = borrower.id
			redirect_to "/borrowers/#{borrower.id}"
		end
	end
	def show
		@lenders = Borrower.find(current_borrower.id).histories
	end
end