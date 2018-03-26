class Form < ApplicationRecord
  belongs_to :user
  #one form have many questions and when delete a form, destroy all questions
  has_many :questions, dependent: :destroy
  #one form have many answers and when delete a form, destroy all answers
  has_many :answers, dependent: :destroy  
  extend FriendlyId
  friendly_id :title, use: :slugged
  #required in form 
  validates :title, :description, :user, presence: true
  #title is uniqueness
 # validates :title, uniqueness: true  
end
