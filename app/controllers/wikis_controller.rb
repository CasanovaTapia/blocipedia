class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    @collaboration = @wiki.collaborations.new
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    @wiki.user = current_user

    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not saved. Please try again."
      render :new
    end
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])

    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "Wiki was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:id])

    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "Wiki was deleted."
      redirect_to wikis_path
    else
      flash[:error] = "Wiki was not deleted. Please try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
