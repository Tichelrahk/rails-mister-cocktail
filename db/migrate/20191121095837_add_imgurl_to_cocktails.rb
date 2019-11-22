class AddImgurlToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :imgurl, :string
  end
end
