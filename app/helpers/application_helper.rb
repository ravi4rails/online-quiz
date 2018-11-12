module ApplicationHelper
  
  def question_status user_id, mcq_id
    question = QuestionUserStatus.where(user_id: user_id, multiple_choice_question_id: mcq_id).last
    question_status = question.status if !question.nil?
  end

  def check_if_answered user_id, mcq_id
    UserResponseValue.where(multiple_choice_question_id: @mcq.id, user_id: current_user.id).last.present?
  end

  def user_selected_option user_id, mcq_id
    selected_option = ""
    unless UserResponseValue.where(multiple_choice_question_id: mcq_id, user_id: user_id).empty? 
      UserResponseValue.where(multiple_choice_question_id: mcq_id, user_id: user_id).last.form_values.each do |key,value|
        selected_option = value
      end
    end
    selected_option
  end

  def get_user_response_value user_id, mcq_id
    unless UserResponseValue.where(multiple_choice_question_id: mcq_id, user_id: user_id).empty? 
      UserResponseValue.where(multiple_choice_question_id: mcq_id, user_id: user_id).last
    end
  end

end


# UserResponseValue.where(multiple_choice_question_id: 26, user_id: 1).last.form_values.each do |key,value|
#   value
# end