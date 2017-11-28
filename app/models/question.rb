class Question < ActiveRecord::Base
  belongs_to :users
  has_many :answers
  validates :question, :presence => true
  scope :newest_first, -> { order(created_at: :desc)}
end
