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
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)

    if @tag.save
      @image.tags.push(@tag)
      flash[:notice] = "Tag has been added!!"
      redirect_to image_path(@image)
    elsif Tag.exists?(:name => @tag.name)
      tag = Tag.find_by name: @tag.name
      @image.tags.push(tag)
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
    if params[:image_id]
      @image = Image.find(params[:image_id])
      @tag = Tag.find(params[:id])
      @image.tags.delete(@tag)
      redirect_to image_path(@image)
    else
      @tag = Tag.find(params[:id])
      @tag.destroy
      redirect_to tags_path
    end
  end

private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
