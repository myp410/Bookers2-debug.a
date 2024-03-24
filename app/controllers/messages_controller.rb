class MessagesController < ApplicationController
  
  def create
    if Entry.where(user_id: current_user.id, room_id: prams[:message][:room_id]).present?
      @message = Message.new(message_params)
      @message.user_id = current_user.id
      @message.save
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    render :validataer unless @message.save
  end
  
  private
  
    def message_params
      params.require(:message).permit(:user_id, :room_id, :content)
    end
end
