class Skill < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :skill_status

  validates :skill_name, presence: true
  validates :skill_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :skill_level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
