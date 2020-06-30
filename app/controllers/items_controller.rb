class ItemsController < ApplicationController

  def index
    @new = Item.includes(:item_images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.item_images.build
    # レイヤーを変更
    # render layout: "nothing"
  end


  def create
    # binding.pry
    @item = Item.new(item_params)
    # @item_image = ItemImage.new(item:image, item_id:)
    # イメージが存在しない時は登録させない
    if item_params[:item_images_attributes] && @item.save!
    redirect_to root_path
  else
    # セレクトボックスの中身を取得
      render :new
  end

  def show
    @item = Item.new
  end

  def purchase


    # レイヤーを変更
    render layout: "nothing"
  end

end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :price, :size, :prefecture_id, :preparation_day_id, :postage_payer_id, item_images_attributes: [:image])
    # params.require(:item).permit(:prefecture_id, :preparation_day_id, :postage_payer_id)

  end

end
