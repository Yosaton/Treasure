class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.json :images
      t.string :city

      t.timestamps
    end
  end
end
