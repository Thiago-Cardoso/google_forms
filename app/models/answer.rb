class Answer < ApplicationRecord
   #one answer have many questions_answers and when delete a answer, destroy all questions_answers
  has_many :questions_answers, dependent: :destroy

  #accepts_nested_attributes_for :questions_answers
  validates :form, presence: true

  #transaction
  def self.create_with_questions_answers form, questions_answers
    answer = nil
    ActiveRecord::Base.transaction do
      answer = Answer.create(form: form)
      questions_answers.each do |qa|
        answer.questions_answers.create(value: qa['value'], question_id: qa['question']['id'])
      end
    end
    answer
  end
end
