class TestPaper < ApplicationRecord
  has_many :multiple_choice_questions, inverse_of: :test_paper
  accepts_nested_attributes_for :multiple_choice_questions, reject_if: :all_blank, allow_destroy: true
end
