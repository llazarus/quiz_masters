class AnswersController < ApplicationController
  before_action :find_answer, only: [:show, :edit, :update, :destroy]
  def new
    @answer = Answer.new
  end
  
  def create
    @question = Question.find params[:question_id] 
    @answer = Answer.new answer_params
    @answer.question = @question
    @answer.user = current_user

    if @answer.save
      redirect_to edit_quiz_question_path(@answer.question.quiz.id,@question)
    else
      redirect_to edit_quiz_question_path(@answer.question.quiz.id,@question)
    end
  end 
  
  def destroy
    question = @answer.question  
    @answer.destroy
    redirect_to edit_quiz_question_path(question.quiz.id, question.id)
  end


  def edit
    @question = Question.find params[:question_id]
  end

  def update 
    if @answer.update answer_params
      redirect_to edit_quiz_question_path(@answer.question.quiz.id,@question)
    else
      redirect_to edit_quiz_question_path(@answer.question.quiz.id,@question)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:correct, :description)
  end

  def find_answer
    @answer = Answer.find params[:id]
  end
end
