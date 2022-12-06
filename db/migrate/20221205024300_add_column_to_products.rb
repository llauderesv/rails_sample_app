class AddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :part_number, :string
  end
end
