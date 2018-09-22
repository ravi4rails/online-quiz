class UserResponseValue < ApplicationRecord
  belongs_to :submission
  belongs_to :multiple_choice_question
  belongs_to :user
end
