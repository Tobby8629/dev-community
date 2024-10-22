class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  PROFILE_TITLE = [
    "Fullstack Developer",
    "Frontend Developer",
    "Backend Developer",
    "UI/UX Designer",
    "DevsOP",
    "Quality Assurance",
    "Line Manager",
    "CTO"
  ].freeze

  def name
    "#{first_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "country",  "first_name", "last_name", "profile_title", "state", "city"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
