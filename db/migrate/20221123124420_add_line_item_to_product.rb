class AddLineItemToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :line_item, null: true, foreign_key: true
  end
end
