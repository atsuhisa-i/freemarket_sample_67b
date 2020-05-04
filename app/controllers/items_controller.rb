class ItemsController < ApplicationController
  def new
    if user_signed_in?
      @item = Item.new
      @item.pictures.build
      @item.build_brand
      @category = Category.all
      @prefecture = Prefecture.all
      @fit = Fit.all
      @quality = Quality.all
      @burden = Burden.all
      @days = Days.all
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
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
    params.require(:item).permit(:name, :explanation, :size, :category, :condition, :postage_payer, :shipping_origin, :days_to_ship, :price, :trading_status, pictures_attributes: [:image], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end
end
