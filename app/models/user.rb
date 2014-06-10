# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  logo                   :string(255)
#  role                   :string(255)
#  age                    :integer
#  gender                 :string(255)
#  date_of_birth          :date
#  address_line1          :string(255)
#  address_line2          :string(255)
#  address_line3          :string(255)
#  city                   :string(255)
#  district               :string(255)
#  state                  :string(255)
#  pin_code               :integer
#  country                :string(255)
#  phone_number           :string(255)
#  mobile                 :string(255)
#  graduation             :string(255)
#  post_graduation        :string(255)
#  about_me               :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :logo, :name, :role, :age, :gender, :date_of_birth, :address_line1, :address_line2, :address_line3, :city, :district, :state, :pin_code, :country, :phone_number, :mobile, :about_me, :graduation, :post_graduation

  has_many :favourite_prescriptions, :dependent => :destroy
  has_many :user_patients
  has_many :patients, :through => :user_patients

  ROLES = %w[nurse doctor hospital university superadmin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end


end
