class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users
  has_many :messages

  validates :project_name, presence: true
  validates :description, presence: true
end
