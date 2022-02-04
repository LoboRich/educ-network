class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups
  has_many :class_students
  has_many :activities
  
  def fullname
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end
end
