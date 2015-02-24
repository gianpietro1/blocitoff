class ListsController < ApplicationController
  before_action :authenticate_user!

  def show
    @list = current_user.list
  end

  def new
    @list = List.new
  end

  def create
     @list = current_user.build_list(params.require(:list).permit(:title))
     if @list.save
       flash[:notice] = "List was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :new
     end
  end

  def edit
     @list = current_user.list
  end

  def update
    @list = current_user.list
    if @list.update_attributes(params.require(:list).permit(:title))
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @title = @list.title
      
      if @list.destroy
        flash[:notice] = "\"#{@title}\" list was deleted successfully."
        render :new
      else
        flash[:error] = "There was an error deleting the list."
        render :show
      end
  end

end
