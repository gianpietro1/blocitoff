class ItemsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  def new
    @item = Item.new
  end

  def create
     @list = current_user.list
     @item = current_user.items.build(params.require(:item).permit(:name))
     @item.list_id = @list.id
     if @item.save
       flash[:notice] = "Item was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the item. Please try again."
       redirect_to @list
     end
  end

  def destroy
    @item = Item.find(params[:id])
    @list = @item.list
      
      if @item.destroy
        flash[:notice] = "\"#{@item.name}\" item was completed/deleted."
      else
        flash[:error] = "There was an error completing/deleting the item."
      end

    respond_with(@item) do |format|
      format.html { redirect_to @list }
    end 
  end

end
