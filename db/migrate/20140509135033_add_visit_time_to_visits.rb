class AddVisitTimeToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :visit_time, :date
  end
end
