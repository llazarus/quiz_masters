class Answer < ApplicationRecord
  belongs_to :question
  # validates :description, presence: true
  # validates :correct, inclusion: { in: [ true, false ] }
  belongs_to :user
end
