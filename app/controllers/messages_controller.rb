class MessagesController < ApplicationController

  def show
    @msg = Message.find(params[:id])
    @msg.update_attribute(:read, true)
  end


  def new
    @msg = Message.new
    @msg.sender_id = current_user.email
  end

  def create
    @msg = Message.new(message_params)
    respond_to do |format|
      if @msg.save
        format.html {redirect_to home_profile_path, notice: 'Message Sent'}
        format.json {render :show, status: :created, location: @msg}
      else
        format.html {render :new}
        format.json {render json: @msg.errors, status: :unprocessable_entity}
      end
    end
  end

  def reply
    @msg = Message.new
    @msg.sender_id = current_user.email
    @msg.receiver_id = params[:Msg][:sender_id]
  end

  def destroy
    @msg = Message.find(params[:id])
    @msg.destroy
    session[:return_to] ||= request.referer
    respond_to do |format|
      format.html{redirect_to session.delete(:return_to), notice: 'Message Erased'}
      format.json{head :no_content}
    end
  end

private

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :content)
  end
end
