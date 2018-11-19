class QuizzesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit]
  before_action :authenticate_user!, only: [:new, :create, :show, :destroy, :edit, :update]
  before_action :find_quiz, only: [:show, :destroy, :edit, :update, :submit]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

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
    @allQuizzes = @temp.where("user_id != ?", current_user)

    @quizzes = Quiz.all.order(created_at: :desc)

    @myCreations = Quiz.where("user_id = ?", current_user).order(created_at: :desc)
    @takes = Take.where("user_id = ?", current_user).order(created_at: :desc)

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
      redirect_to quizzes_path
    else
      render :edit
    end
  end

  def submit
    questions = @quiz.questions
    userAnswers = quiz_submit_params[:answers]
    correctAnswers = 0
    quiz_submit_params.each do |questionId, answerId|
      dbQuestion = questions.detect { |q| q[:id] == questionId.to_i }
      dbAnswer = dbQuestion.answers.detect { |a| a[:id] == answerId.to_i }
      if dbAnswer[:correct]
        correctAnswers += 1
      end
    end
    score = correctAnswers.to_f / questions.length.to_f * @quiz.points.to_f
    take = Take.find_by(quiz_id: @quiz.id, user_id: current_user.id)
    if take.score < score
      score_diff = score.to_i - take.score.to_i
      if take.update(score: score, attempts: take.attempts + 1)
        user = User.find(current_user.id)
        user.update(points: user.points + score_diff)
      end
    else
      take.update(attempts: take.attempts + 1)
    end
    flash["success"] = "You got #{correctAnswers} out of #{questions.length} correct!"
    redirect_to quiz_path(@quiz)
  end

  private

  def quiz_submit_params
    params.require(:answers).permit!
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :difficulty, :points)
  end

  def find_quiz
    @quiz = Quiz.find params[:id]
  end

  def authorize_user!
    unless can? :crud, @quiz
      flash[:danger] = "Access Denied"
      redirect_to quizzes_path
    end
  end
end
