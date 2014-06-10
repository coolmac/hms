# == Schema Information
#
# Table name: categories
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  master_category :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :master_category, :title
end
