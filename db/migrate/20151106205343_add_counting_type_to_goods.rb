class AddCountingTypeToGoods < ActiveRecord::Migration
  def change
    add_column :goods, :counting_type, :string
  end
end
