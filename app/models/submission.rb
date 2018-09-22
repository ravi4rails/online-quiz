class Submission < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :test_paper, optional: true
  has_many :user_response_values
end
