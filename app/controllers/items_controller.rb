class ItemsController < ApplicationController

  def index
    @new = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    # レイヤーを変更
    # render layout: "nothing"
    @item.item_images.new
  end

  def show
    @item = Item.new
  end

  def purchase


    # レイヤーを変更
    render layout: "nothing"
  end

  def create
    # Item.create(item_params)
    # if @item.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
    @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new
  end
end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :price, :size, :prefecture_id, :preparation_day_id, :postage_payer_id, item_images_attributes: [:image])
    # params.require(:item).permit(:prefecture_id, :preparation_day_id, :postage_payer_id)

  end

end
