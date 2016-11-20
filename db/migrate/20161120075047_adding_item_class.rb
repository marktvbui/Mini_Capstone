class AddingItemClass < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :item_class, :string 
  end
end
