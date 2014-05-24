class CreateFavouritePrescriptions < ActiveRecord::Migration
  def change
    create_table :favourite_prescriptions do |t|
      t.references :user
      t.string :medicine_name

      t.timestamps
    end
    add_index :favourite_prescriptions, :user_id
  end
end
