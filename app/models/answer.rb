class Answer < ActiveRecord::Base
  belongs_to :questions
  belongs_to :users
  validates :response, :presence => true
end
