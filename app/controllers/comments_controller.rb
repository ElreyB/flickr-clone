class CommentsController < ApplicationController

  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "You comment has been added!!!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "<%= image_tag('oooops.gif') %>"
    end
  end
end
