class AddImageToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :image, :string
  end
end
