class AddEnabledToDescriptiveQuestions < ActiveRecord::Migration
  def change
    add_column :descriptive_questions, :enabled, :integer
  end
end
