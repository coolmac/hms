class CreateDescriptiveQuestions < ActiveRecord::Migration
  def change
    create_table :descriptive_questions do |t|
      t.string :title
      t.string :sub_category
      t.string :category
      t.string :super_category
      t.integer :enabled

      t.timestamps
    end

    add_index :descriptive_questions, [:super_category, :enabled]
    add_index :descriptive_questions, [:super_category, :category, :enabled], :name => "index_descriptive_question_on_three_cols"

  end
end
