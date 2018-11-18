class TakesController < ApplicationController
  def create
    @quiz = Quiz.find(params[:quiz_id])
    @take = Take.new(
      quiz_id: @quiz.id,
      user_id: current_user.id,
      score: 0,
      attempts: 0
    )

    if @take.save
      redirect_to quizzes_path
    else
      flash[:alert] = "Unable to begin quiz"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
    @take = Take.find(params[:id])
    @take.destroy
    redirect_to quizzes_path
  end
end
