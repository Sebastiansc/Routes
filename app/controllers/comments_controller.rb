class CommentsController < ApplicationController
  def index
    type = "User" if params[:user_id]
    type = "Contact" if params[:contact_id]


    id = params[:user_id] || params[:contact_id]

    @comments = Comment.where(topic_id: id, topic_type: type)
    render json: @comments
  end
end
