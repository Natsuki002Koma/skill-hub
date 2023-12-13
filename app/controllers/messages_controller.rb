class MessagesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @message = Message.new
    @messages = @project.messages.includes(:user)
  end

  def create
    @project = Project.find(params[:project_id])
    @message = @project.messages.new(message_params)
    if @message.save
      redirect_to project_messages_path(@project)
    else
      @messages = @project.messages.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @project = @message.project
    @message.destroy if current_user == @message.user
    redirect_to project_messages_path(@project)
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
