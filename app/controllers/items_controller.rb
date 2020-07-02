class ItemsController < ApplicationController

  def index
    @new = Item.includes(:item_images).order('created_at DESC')
    #売れてない商品だけ@productsに格納する
    @item_images = ItemImage.all
  end

  def new
    @item = Item.new
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    # レイヤーを変更
    # render layout: "nothing"
  end


  def create
    # binding.pry
    @item = Item.new(item_params)
    @item.save
    # イメージが存在しない時は登録させない
  #   if item_params[:item_images_attributes] && @item.save!
    redirect_to root_path
  # else
  #   # セレクトボックスの中身を取得
  #     render :new
    
  end

  def show
    @item = Item.new
  end

  def purchase
    # レイヤーを変更
    render layout: "nothing"
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :price, :size, :category, :prefecture_id, :preparation_day_id, :postage_payer_id, item_images_attributes: [:image])
    # params.require(:item).permit(:prefecture_id, :preparation_day_id, :postage_payer_id)
  end
