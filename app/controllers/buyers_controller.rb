class BuyersController < ApplicationController

  before_action :set_item

  def index

  end

end

private

def set_item
  @item = Item.find(params[:item_id])
end