class CreateVisitQuestions < ActiveRecord::Migration
  def change
    create_table :visit_questions do |t|
      t.integer :visit_id
      t.integer :question_id
      t.integer :answer_id

      t.timestamps
    end
  end
end
