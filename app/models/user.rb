class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills
  has_many :tweets
  has_many :projects, through: :project_users
  has_many :project_users

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :hire_date, presence: true
end
