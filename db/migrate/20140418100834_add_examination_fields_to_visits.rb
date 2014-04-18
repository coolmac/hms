class AddExaminationFieldsToVisits < ActiveRecord::Migration
  def change
  	add_column :visits, :gpe, :text
  	add_column :visits, :vitals, :text
  	add_column :visits, :general_examination, :text  	
  end
end
