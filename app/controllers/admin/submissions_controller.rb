class Admin::SubmissionsController < ApplicationController
  layout 'admin'
  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @submission.user_response_values.each do |response_value|
      response_value.form_values.each do |key,value|
        @question = @submission.test_paper.multiple_choice_questions.find_by("question LIKE ?","#{key.strip}%")
        @answer = @question.correct_answer
        if @answer.strip == value.strip
          puts "========================true==========================="
          @score = @score.to_i + 1
        else
          puts "*************************false*************************"
        end
      end
    end
  end

end
