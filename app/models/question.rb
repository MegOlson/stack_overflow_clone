class Question < ActiveRecord::Base
  belongs_to :users
  validates :question, :presence => true
end
