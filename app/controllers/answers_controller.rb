class AnswersController < ApplicationController
  def create
    @question = Question.find params[:question_id]
    @answer = Answer.new answer_params
    @answer.question = @question

    if @answer.save
      # redirect_to question_path(@question)
    else
      @answers = @question.answers.order(created_at: :desc)
      # render "questions/show"
    end
  end
end
