class ItemsController < ApplicationController

  def index
    @new = Item.all
  end

  def new
    @item = Item.new
    # レイヤーを変更
    # render layout: "nothing"
  end

  def create
  end

  def show
    @item = Item.new
  end

  def purchase


    # レイヤーを変更
    render layout: "nothing"
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :content, :price, :size,)
  end

end
