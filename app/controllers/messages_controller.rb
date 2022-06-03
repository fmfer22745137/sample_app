class MessagesController < ApplicationController
  before_action :logged_in_user, only: :create

  def sent
    @type_id = :sent
    @type_name = "送信したメッセージ"
    @messages = current_user.outbox.paginate(:page => params[:page], :per_page => 15)
    render 'index'
  end

  def received
    @type_id = :received
    @type_name = "受信したメッセージ"
    @messages = current_user.inbox.paginate(:page => params[:page], :per_page => 15)
    render 'index'
  end

  def create
    @message = current_user.messages_sent.build(message_params)
    @message.from = current_user
    if !@message.body.blank? && @message.save
      flash[:success] = "Message sent!"
      redirect_to messages_sent_path
    else
      render 'messages/new'
    end    
  end

  private
    def message_params
      params.require(:message).permit(:body, :to_id)
    end  
 
end
