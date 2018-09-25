module ApplicationHelper
  
  def question_status user_id, mcq_id
    QuestionUserStatus.find_by(user_id: user_id, multiple_choice_question_id: mcq_id).status
  end

end
