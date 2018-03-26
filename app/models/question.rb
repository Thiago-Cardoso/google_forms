class Question < ApplicationRecord
  belongs_to :form
   #many questions answers have one question and when delete a question, destroy all questions_answers
  has_many :questions_answers, dependent: :destroy
  validates :title, :kind, :form, presence: true  
  enum kind: [ :short_text, :long_text, :integer, :boolean ]  
end
