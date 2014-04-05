class AddDetailsToQuestions < ActiveRecord::Migration

  def change
  	remove_column :questions, :category_id
  	add_column :questions, :sub_category, :string
  	add_column :questions, :category, :string
  	add_column :questions, :super_category, :string
  	add_column :questions, :answer_type, :integer
  end

end
