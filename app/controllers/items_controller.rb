class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create, :get_category_children, :get_category_children, :get_category_grandchildren]

  def index
    @items = Item.all.includes(:pictures).order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.pictures.build
      @item.build_brand
      @category_parent_array = ["---"]
#データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
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
    @user = @item.seller
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def get_category_children
    respond_to do |format| 
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end
  def get_category_grandchildren
    respond_to do |format| 
      format.html
      format.json do
        @grandchildren = Category.find("#{params[:child_id]}").children
      end
    end
  end

private

  def item_params
    params.require(:item).permit(:name, :explanation, :size, :category_id, :condition, :postage_payer, :shipping_origin, :days_to_ship, :price, :trading_status, pictures_attributes: [:image, :_destroy, :id], brand_attributes: [:name]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
