class Quiz < ApplicationRecord
  belongs_to :user

  has_many :questions, dependent: :destroy

  validates :title, 
    presence: true,
    length: {
      minimum: 10
    }

  validates :description,
    presence: true,
    length: {
      minimum: 25
    }

  validates :difficulty,
    presence: true

  validates :points,
    presence: true,
    numericality: {
      greater_than: 0
    }
  
  after_save :titleize_title


  private 

  def titleize_title
    self.title = self.title.titleize.strip
  end

end
