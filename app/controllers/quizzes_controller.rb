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
      @question = Question.new(quiz_id: @quiz.id, user_id: current_user.id)
      if @question.save
        redirect_to root_path 
        # render :page
      end
      # redirect_to quiz_path(@quiz.id)
    else
      render :new
    end
  end

  def show
  end

  def index
    @quizzes = Quiz.all.order(created_at: :desc)
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_path
  end

  def edit
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
