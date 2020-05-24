class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:pictures).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.pictures.build
      @item.build_brand
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.pictures.build
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.seller
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :explanation, :size, :category_id, :condition, :postage_payer, :shipping_origin, :days_to_ship, :price, :trading_status, pictures_attributes: [:image, :_destroy, :id], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
end
