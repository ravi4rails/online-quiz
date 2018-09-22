class UserResponseValue < ApplicationRecord
  belongs_to :submission, optional: true
  belongs_to :multiple_choice_question, optional: true
  belongs_to :user, optional: true
end
