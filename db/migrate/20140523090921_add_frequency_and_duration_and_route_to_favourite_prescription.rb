class AddFrequencyAndDurationAndRouteToFavouritePrescription < ActiveRecord::Migration
  def change
    add_column :favourite_prescriptions, :frequency, :string
    add_column :favourite_prescriptions, :duration, :string
    add_column :favourite_prescriptions, :route, :string
  end
end
