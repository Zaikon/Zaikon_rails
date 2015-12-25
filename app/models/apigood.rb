class Apigood
  # プロパティの設定
  attr_accessor :title, :image_url, :url, :price

  def initialize(title, image_url, url, price)
    @title = title
    @image_url = image_url
    @url = url
    @price = price
  end
end