class LoansController < ApplicationController

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(loan_params)
    @loan.owner_id = current_user.id

    respond_to do |format|
      if @loan.save
        format.html {redirect_to root_path, notice: 'Loan successfully added'}
        format.json {render :show, status: :created, location: @loan}
      else
        format.html {render :new}
        format.json {render json: @loan.errors, status: :unprocessable_entity}
      end
    end
  end


  private

  def loan_params
    params.require(:loan).permit(:book_id,:borrow_id)
  end
end
