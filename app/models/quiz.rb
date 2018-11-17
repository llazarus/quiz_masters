class Quiz < ApplicationRecord
  belongs_to :user

  has_many :questions, dependent: :destroy

  validates :title, 
    presence: true

  validates :description,
    presence: true


  validates :difficulty,
    presence: true

  validates :points,
    presence: true,
    numericality: {
      greater_than: 0
    }
  
  before_save :titleize_title


  private 

  def titleize_title
    self.title = self.title.titleize.strip
  end

end
