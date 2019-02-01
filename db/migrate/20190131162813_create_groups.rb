class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.integer :neighborhood_id
      t.integer :catagory_id

      t.timestamps
    end
  end
end
