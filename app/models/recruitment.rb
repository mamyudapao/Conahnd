class Recruitment < ApplicationRecord
  default_scope -> {order(created_at: :desc)}
  validates :title, presence: true
  validates :recruitment_numbers, presence: true
  validates :hardware, presence:true
  validates :game_id, presence:true
  validates :communication_tool, presence:true
  validates :comment, length:{maximum:140}
end
