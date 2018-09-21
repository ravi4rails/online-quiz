class McqOption < ApplicationRecord
  belongs_to :multiple_choice_question, optional: true
end
