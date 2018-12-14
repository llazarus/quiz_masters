class Question < ApplicationRecord
  belongs_to :quiz
  belongs_to :user

  has_many :answers, dependent: :destroy, inverse_of: :question

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  validates :description, presence: true, length: { minimum: 25}, on: :update

  private

  def titleize_title
    self.title = title.titleize.strip
  end

end
