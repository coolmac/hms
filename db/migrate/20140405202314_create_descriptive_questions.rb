class CreateDescriptiveQuestions < ActiveRecord::Migration
  def change
    create_table :descriptive_questions do |t|
      t.string :title
      t.string :sub_category
      t.string :category
      t.string :super_category

      t.timestamps
    end
  end
end