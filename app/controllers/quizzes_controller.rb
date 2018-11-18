class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :find_quiz, only: [:show, :destroy, :edit, :update]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user

    if @quiz.save
      redirect_to new_quiz_question_path(@quiz.id)	
    else
      render :new
    end
  end

  def show
  end

  def index
    @temp = Quiz.all.order(created_at: :desc)
    @quizzes = @temp.where("user_id != ?", current_user)
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  def edit
    @questions = @quiz.questions
  end

  def update
    if @quiz.update quiz_params
      redirect_to quiz_path(@quiz.id)
    else
      render :edit
    end
  end


  private

  def quiz_params
    params.require(:quiz).permit(:title, :description, :difficulty, :points)
  end

  def find_quiz
    @quiz = Quiz.find params[:id]
  end
  

end
