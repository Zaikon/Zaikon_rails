json.categories @categories do |category|
  json.(category, :id, :name)
  json.goods category.goods do |good|
    json.partial! 'api/categories/good', good: good
  end
end
