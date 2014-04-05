class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :logo, :name, :role

  has_many :user_patients
  has_many :patients, :through => :user_patients

  ROLES = %w[nurse doctor hospital university superadmin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end


end
