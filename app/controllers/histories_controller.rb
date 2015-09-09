class HistoriesController < ApplicationController
	def create
		history = History.new(amount: params[:amount], borrower_id: params[:id], lender_id: current_lender.id)
		if history.invalid?
			flash[:errors] = history.errors.full_messages
			redirect_to "/lenders/#{current_lender.id}"
		else
			lender = Lender.find(current_lender.id)
			borrower = Borrower.find(params[:id])
			if lender.money > history.amount 
				history.save
				borrower.raised += history.amount
				borrower.save
				lender.money -= history.amount
				lender.save
				redirect_to "/lenders/#{current_lender.id}"
			else
				flash[:error] = 'Insufficient funds'
				redirect_to "/lenders/#{current_lender.id}"
			end
		end
	end
end