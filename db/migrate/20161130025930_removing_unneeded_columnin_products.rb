class RemovingUnneededColumninProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :item_class, :string
  end
end
