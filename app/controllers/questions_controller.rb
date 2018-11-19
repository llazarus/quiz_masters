  class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!
  
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
      
      # respond_to do |format|
      #   format.html { render :new } 
      #   format.json { render json: @question }
      # end
      # TODO redirect/render will be unneccesary because of react. 
      redirect_to edit_quiz_path(@quiz.id)
    else 
      # TODO same as above
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

    # @question = Question.find params[:id]
    # @answers = Answer.where("question_id = #{@question.id}")
    # @difficulty = @question.difficulty.to_i
    # answers_array = params[:answers]
    # question = params[:question]

    # if @question.update(title: question.title, description: question.description)
    #   @difficulty.times do |x|
    #     @answers[x].update(description: answers_array[x].description, correct: answers_array[x].correct)
    #   end
    #   @quiz_new = Question.create(quiz_id: @question.quiz_id, user_id: current_user.id)
    #   @difficulty.times do |x|
    #     Answer.create(description: x, question_id: @question.id, user_id: current_user.id )
    #   end
    #   render json: { quizID: @quiz_new.id, questionID: @question.id }
    # else
    #   render json: { status: 303 }
    # end
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
      format.html { render } # this will render `views/questions/.html.erb`
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
