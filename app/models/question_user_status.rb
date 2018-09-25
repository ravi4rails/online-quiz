class QuestionUserStatus < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :multiple_choice_question, optional: true
end
