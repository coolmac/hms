class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :logo, :name, :role, :age, :gender, :date_of_birth, :address_line1, :address_line2, :address_line3, :city, :district, :state, :pin_code, :country, :phone_number, :mobile, :about_me, :graduation, :post_graduation

  has_many :favourite_prescriptions
  has_many :user_patients
  has_many :patients, :through => :user_patients

  ROLES = %w[nurse doctor hospital university superadmin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end


end
