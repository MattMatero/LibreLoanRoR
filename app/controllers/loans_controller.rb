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
    @loan.book_id = params[:Book][:book_id]
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
    begin
      @loan = Loan.find(params[:id])
    rescue Exception => e
      redirect_to home_profile_path
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy
    session[:return_to] ||= request.referer

    respond_to do |format|
      format.html{redirect_to session.delete(:return_to), notice: 'Loan successfully ended'}
      format.json{head :no_content}
    end
  end


  private

  def loan_params
    params.require(:loan).permit(:Book,:book_id,:borrow_id)
  end
end
