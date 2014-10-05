class CollaborationsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])

    if @wiki.users << @user
      flash[:notice] = "Collaborator was added to this wiki."
      redirect_to @wiki 
    else
      flash[:error] = "Collaborator was not added. Please try again."
      render :show
    end    
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new
  end
end
