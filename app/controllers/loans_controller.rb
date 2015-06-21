class LoansController < ApplicationController

  def index
    if !current_user.nil?
      @loans = Loan.where(owner_id: current_user.id)
    else
      redirect_to root_path, alert: "Please Log In"
    end
  end

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

  def show
    @loan = Loan.find(params[:id])
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    respond_to do |format|
      format.html{redirect_to home_profile_path, notice: 'Loan successfully ended'}
      format.json{head :no_content}
    end
  end


  private

  def loan_params
    params.require(:loan).permit(:book_id,:borrow_id)
  end
end
