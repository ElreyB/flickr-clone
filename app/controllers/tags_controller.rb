class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @image = Image.find(params[:id])
    @tag = Tag.new
  end

  def create
    @image = Image.find(params[:id])
    @tag = @image.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag has been added!!"
      redirect_to image_path(@image)
    else
      flash[:alert] = "Ooops! Something happen."
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      flash[:notice] = "Tag has been updated!"
      redirect_to tag_path(@tag)
    else
      flash[:alert] = "Ooops! Something went wrong."
      redirect_to :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end
  
end
