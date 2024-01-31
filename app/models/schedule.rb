class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time

  validates :date, presence: true
  validates :time_id, numericality: { other_than: 1 , message: "can't be blank"}
end
