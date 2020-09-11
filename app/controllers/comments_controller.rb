class CommentsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @comment = Coment.create
  end

end
