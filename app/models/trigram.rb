# == Schema Information
#
# Table name: trigrams
#
#  id          :integer          not null, primary key
#  trigram     :string(3)
#  score       :integer
#  owner_id    :integer
#  owner_type  :string(255)
#  fuzzy_field :string(255)
#

class Trigram < ActiveRecord::Base
  include Fuzzily::Model
end
