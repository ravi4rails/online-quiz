class MultipleChoiceQuestionsController < ApplicationController

  before_action :authenticate_user!

  def load_question
    @mcq = MultipleChoiceQuestion.find(params[:mcq_id])
    @submission = Submission.find(params[:submission])
    @test_paper = @mcq.test_paper
  end

  def load_previous_question
    @mcq = MultipleChoiceQuestion.find(params[:mcq_id])
    @submission = Submission.find(params[:submission])
    @test_paper = @mcq.test_paper
    @previous_mcq = @test_paper.multiple_choice_questions.where('id < ?', @mcq.id).last
  end

  def load_next_question
    @mcq = MultipleChoiceQuestion.find(params[:mcq_id])
    @submission = Submission.find(params[:submission])
    @test_paper = @mcq.test_paper
    @next_mcq = @test_paper.multiple_choice_questions.where('id > ?', @mcq.id).first
    @last_mcq = @test_paper.multiple_choice_questions.last
  end

end
