class MultipleChoiceQuestion < ApplicationRecord
  belongs_to :test_paper, optional: true
  has_many :user_response_values
  has_many :mcq_options, inverse_of: :multiple_choice_question
  accepts_nested_attributes_for :mcq_options, reject_if: :all_blank, allow_destroy: true
end
