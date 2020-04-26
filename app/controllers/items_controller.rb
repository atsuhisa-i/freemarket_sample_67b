class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.pictures.build
    @item.build_category
    @item.build_brand
    @categories = Category.all
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end

  def show
  end

private

  def item_params
    params.require(:item).permit(:name, :explanation, :size, :condition, :postage_payer, :shipping_origin, :days_to_ship, :price, :trading_status, pictures_attributes: [:image], category_attributes: [:name], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
end
