class ProductsController < ApplicationController
  # before_action :error , only:[:show]

  def show
    
  end

  def new
    @addresses = Address.all
  end
  
  def index
    
    @items = [{name:"いぬ,俺いぬ、飛んでるいぬ、途中から消える途中から",price:194782,image:"https://scontent-lga3-1.cdninstagram.com/vp/62f3f45922905dafafe577813b3498d5/5E10DE4F/t51.2885-15/e35/c150.0.601.601a/66607752_161037741733443_119877856891125158_n.jpg?_nc_ht=scontent-lga3-1.cdninstagram.com"},
      {name:"いぬやけど飛んでます、途中から消える途中から消える",price:333333,image:"https://photo1.ganref.jp/photo/0/8099b8acdc35cde874b69251df88aed6/thumb5.jpg"},
      {name:"いぬ,俺いぬ、飛んでるいぬ、途中から消える途中から",price:44444,image:"https://twihash.com/wp-content/uploads/2019/07/UBXIkCKPl7.jpg"},
      {name:"いぬ,俺いぬ、飛んでるいぬ、途中から消える途中から",price:44444,image:"http://pbs.twimg.com/media/CBA_xL_VIAAOvJK.jpg"}
    ]

    @products_ladies = Product.where(category_id: "")
    # DBの特定のカラム（今回はcategory_id:からデータを取得）のレコードを取得
    # category_idと表示したいカテゴリーの関連を記述
    # 4回??繰り返しの指定回数追加（レスポンシブデザイン実装後はどの条件での表示回数になるか）
    # 4つのデータ抽出の条件は繰り返し回数以外にはないか
    # カテゴリーテーブルがない為rake db:migurateができずマイグレーションエラーなう
  end

  def error  
    # unless 商品があるか
    #   redirect_to('products/error')
    # end
    # サーバーサイド実装後修正
  end


end