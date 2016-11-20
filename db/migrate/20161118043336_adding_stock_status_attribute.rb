class AddingStockStatusAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :instock, :boolean, default: true
  end
end
