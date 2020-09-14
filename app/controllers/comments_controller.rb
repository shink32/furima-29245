class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @item = Item.all
    @comment = Comment.create(comment_params)

    if @comment.save
    redirect_to item_path(@comment.item_id)
    end
  end

  private
  def comment_params
    params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
