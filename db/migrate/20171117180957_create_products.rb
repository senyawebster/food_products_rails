class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :cost
      t.integer :country_of_origin

      t.timestamps
    end
  end
end
