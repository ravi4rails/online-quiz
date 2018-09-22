class UserResponseValuesController < ApplicationController

  before_action :authenticate_user!

  def create
    @submission = Submission.find(params[:user_response_value][:submission_id])
    total_response_value = params[:user_response_value]
    submission_values = {"user_id" => params[:user_response_value][:user_id], "multiple_choice_question_id" => params[:user_response_value][:multiple_choice_question_id], "submission_id" => params[:user_response_value][:submission_id]}
    # puts submission_values
    form_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}

    puts form_values
    @user_response_value = UserResponseValue.create(user_response_value_params)
    @user_response_value.update(form_values: form_values)
    @mcq = MultipleChoiceQuestion.find(params[:user_response_value][:multiple_choice_question_id])
    @test_paper = @mcq.test_paper
    @next_mcq = @test_paper.multiple_choice_questions.where('id > ?', @mcq.id).first
  end

  private 

    def user_response_value_params
      params.require(:user_response_value).permit(:submission_id, :multiple_choice_question_id, :user_id)
    end

end