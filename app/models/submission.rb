class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :test_paper
end
