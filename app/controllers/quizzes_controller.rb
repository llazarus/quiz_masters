class QuizzesController < ApplicationController
  before_action :authenticate_user!

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new quiz_params
    @quiz.user = current_user

    if @quiz.save
      redirect_to quiz_path(@quiz.id)
    else
      render :new
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :description, :difficulty, :points)
  end
end
