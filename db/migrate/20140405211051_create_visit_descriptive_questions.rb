class CreateVisitDescriptiveQuestions < ActiveRecord::Migration
  def change
    create_table :visit_descriptive_questions do |t|
      t.integer :visit_id
      t.integer :descriptive_question_id
      t.text :answer

      t.timestamps
    end
  end
end
