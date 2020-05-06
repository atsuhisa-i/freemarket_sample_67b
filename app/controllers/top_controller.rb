class TopController < ApplicationController
  def index
    @category = Category.all
  end
end
