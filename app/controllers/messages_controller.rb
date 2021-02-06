class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params
    if @message.valid?
      MessageMailer.contact(@message).deliver_now
      flash[:success] = "Votre message a bien été envoyé !"
      redirect_to root_path
    else
      flash[:danger] = "Votre message n'a pas pu être envoyé. Réessayez, ou contactez-moi à liana.mikael@enbarque-orientation.com"
      redirect_to root_path
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :email, :phone_number, :body)
  end
  
end