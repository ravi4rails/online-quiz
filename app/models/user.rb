class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :submissions
  has_many :user_response_values
  has_many :question_user_statuses

  validate :validate_username

  def validate_username
    if User.where(username: username).exists?
      errors.add(:username, "already exists")
    end
  end
end
