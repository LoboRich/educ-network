class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups
  has_many :class_students

  has_many :activities
  
  has_many :posts
  enum roles: { admin: "admin", teacher: "teacher", student: "student", guardian: "guardian"}

  def fullname
    "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end
end
