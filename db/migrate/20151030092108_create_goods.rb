class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.integer :stock_num
      t.integer :notification_num
      t.text :image
      t.text :amazon_url
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
