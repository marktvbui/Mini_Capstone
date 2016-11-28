class CorrectingSpellingErrorinOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :quanity, :quantity
  end
end
