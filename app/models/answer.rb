class Answer < ActiveRecord::Base
  belongs_to :questions
  belongs_to :users
  validates :response, :presence => true
  scope :todays_answers, -> { where("created_at >= ?", (DateTime.now - 1.days)).order(created_at: :desc)}
end
