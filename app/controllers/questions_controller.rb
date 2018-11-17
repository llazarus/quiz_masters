class QuestionsController < ApplicationController
  def new 
    # Question will initially be created without title or
    # description. It will only have the PK which is id.
    @question = Question.new
    @quiz = Quiz.find params[:quiz_id]

    @question.quiz = @quiz
    @quiz.question.user = current_user
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end


end
