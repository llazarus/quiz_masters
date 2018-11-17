class Question < ApplicationRecord
  belongs_to :quiz

  has_many :answers, dependant: :destroy

  validates :title, presence: true, length: { minimum: 10 }, uniqueness: { scope: :quiz }, on: :update

  validates :description, presence: true, length: { minimum: 25}, on: :update


  private

  def titleize_title
    self.title = title.titleize.strip
  end



  

end
