class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :quizzes
  has_many :questions
  has_many :answers

  before_save :titleize_first_name
  before_save :titleize_last_name

  private 

  def titleize_first_name
    self.title = self.first_name.titleize
  end

  def titleize_last_name
    self.title = self.last_name.titleize
  end
end
