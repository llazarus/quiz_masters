  class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [ :edit, :destroy ]
  
  def new 
    # Question will initially be created without title or
    # description. It will only have the PK which is id.
    @question = Question.new

  end

  def create
    puts params
    @quiz = Quiz.find params[:quiz_id]
    @question = Question.new question_params
    @question.quiz = @quiz
    @question.user = current_user

    if @quiz.user == current_user && @question.save
      
 
      redirect_to edit_quiz_path(@quiz.id)
    else 
      flash[:danger] = "Unable to create question"

    end
  end

  def edit
    @quiz = @question.quiz
    @answers = @question.answers
    @answer = Answer.new
  end
  
  def update
   
    if @question.update question_params
      redirect_to edit_quiz_question_path(@question.quiz.id, @question.id)
    else
      redirect_to edit_quiz_question_path(@question.quiz.id, @question.id)
    end


  end

  def destroy
    @question.destroy

    redirect_to edit_quiz_path(@question.quiz.id)
  end

  private

  def question_params
    params.require(:question).permit(:description)
  end

  def answer_params
    params.require(:answer).permit(:description, :correct)
  end

  def find_question
    @question = Question.find params[:id]
  end

  def format_render
    respond_to do |format|
      format.html { render } 
      format.json { render json: @question }
    end
  end

  def authorize_user!
    unless can? :crud, @question
      flash[:danger] = "Access Denied"
      redirect_to quizzes_path
    end
  end

end
