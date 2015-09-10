class SessionsController < ApplicationController
	def new
		# session[:user_id] = nil
	end
	def page
		# session[:lender_id] = nil
	end
	def login
		borrower = Borrower.find_by_email(params[:email])
		if borrower 
			if borrower && borrower.authenticate(params[:password])
				session[:borrower_id] = borrower.id
				redirect_to "/borrowers/#{borrower.id}"
			else
				flash[:error] = 'Invalid Email/Password combination'
				redirect_to '/sessions/page'
			end
		else 
			lender = Lender.find_by_email(params[:email]) 
			if lender && lender.authenticate(params[:password])
				session[:lender_id] = lender.id
				redirect_to "/lenders/#{lender.id}"
			else
				flash[:error] = 'Invalid Email/Password combination'
				redirect_to '/sessions/page'
			end
		end
	end
	def destroy
		session[:borrower_id] = nil
		session[:lender_id] = nil
		redirect_to '/sessions/page'
	end
	def chatroom
		session[:borrower_id] = nil
		session[:lender_id] = nil
	end




end