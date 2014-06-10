class CreateVisitDescriptiveQuestions < ActiveRecord::Migration
  def change
    create_table :visit_descriptive_questions do |t|
      t.integer :visit_id
      t.integer :descriptive_question_id
      t.text :answer

      t.timestamps
    end

    add_index :visit_descriptive_questions, :visit_id
    add_index :visit_descriptive_questions, [:visit_id, :descriptive_question_id], :name => "index_vdq_on_visit_id_and_question_id"

  end
end
