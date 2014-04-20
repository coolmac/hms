class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.datetime :follow_up_date
      t.text :final_diagnosis
      t.text :comments
      t.integer :visit_id

      t.timestamps
    end
  end
end
