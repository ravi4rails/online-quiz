class UserResponseValuesController < ApplicationController

  before_action :authenticate_user!

  def create
    if params[:user_response][:user_response_value_id].present?
      total_response_value = params[:user_response]
      submission_values = {
        "user_id" => params[:user_response][:user_id], 
        "multiple_choice_question_id" => params[:user_response][:multiple_choice_question_id], 
        "submission_id" => params[:user_response][:submission_id],  
        "already_answered"=>params[:user_response][:already_answered], 
        "user_response_value_id" => params[:user_response][:user_response_value_id]
      }
      form_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
      @submission = Submission.find(params[:user_response][:submission_id])      
      @mcq = MultipleChoiceQuestion.find(params[:user_response][:multiple_choice_question_id])      
      @test_paper = @mcq.test_paper
      if @mcq.id == @test_paper.multiple_choice_questions.last.id 
        @next_mcq = @test_paper.multiple_choice_questions.where(id: @mcq.id).first
      else     
        @next_mcq = @test_paper.multiple_choice_questions.where('id > ?', @mcq.id).first
      end
      @user_response_value = UserResponseValue.find(params[:user_response][:user_response_value_id])
      @user_response_value.update(form_values: form_values)
      respond_to do |format|
        if @mcq.id == @test_paper.multiple_choice_questions.last.id
          format.html {redirect_to test_submission_path(test_paper_id: @test_paper.id)}
        else
          format.js {}
        end
      end
    else
      total_response_value = params[:user_response]
      submission_values = {"user_id" => params[:user_response][:user_id], "multiple_choice_question_id" => params[:user_response][:multiple_choice_question_id], "submission_id" => params[:user_response][:submission_id]}
      form_values = total_response_value.dup.delete_if {|k,_| submission_values.key?(k)}
      puts form_values
      @submission = Submission.find(params[:user_response][:submission_id])
      @mcq = MultipleChoiceQuestion.find(params[:user_response][:multiple_choice_question_id])
      @test_paper = @mcq.test_paper
      if @mcq.id == @test_paper.multiple_choice_questions.last.id 
        @next_mcq = @test_paper.multiple_choice_questions.where(id: @mcq.id).first
      else 
        @next_mcq = @test_paper.multiple_choice_questions.where('id > ?', @mcq.id).first
      end
      @user_response_value = UserResponseValue.new(user_response_value_params)
      respond_to do |format|
        if @user_response_value.save 
          @user_response_value.update(form_values: form_values)
          QuestionUserStatus.create(user_id: current_user.id, multiple_choice_question_id: @mcq.id, status: "Answered")
          if @mcq.id == @test_paper.multiple_choice_questions.last.id
            format.html {redirect_to test_submission_path(test_paper_id: @test_paper.id)}
          else
            format.js {}
          end
        end 
      end
    end
  end

  def question_marked_for_review
    @mcq = MultipleChoiceQuestion.find(params[:mcq_id])
    @test_paper = @mcq.test_paper
    @submission = Submission.find(params[:submission_id])
    if @mcq.id == @test_paper.multiple_choice_questions.last.id 
      @next_mcq = @test_paper.multiple_choice_questions.where(id: @mcq.id).first
    else
      @next_mcq = @test_paper.multiple_choice_questions.where('id > ?', @mcq.id).first
    end
    QuestionUserStatus.create(user_id: current_user.id, multiple_choice_question_id: @mcq.id, status: "Marked for Review")
    respond_to do |format|
      if @mcq.id == @test_paper.multiple_choice_questions.last.id
        format.html {redirect_to test_submission_path(test_paper_id: @test_paper.id)}
      else
        format.js {}
      end
    end
  end

  private 

    def user_response_value_params
      params.require(:user_response).permit(:submission_id, :multiple_choice_question_id, :user_id)
    end

end