class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  
  def new 
    # Question will initially be created without title or
    # description. It will only have the PK which is id.
    @question = Question.new
    @quiz = Quiz.find params[:quiz_id]
    @question.quiz = @quiz
    @question.user = current_user

    if @quiz.user == current_user && @question.save
      # render json: question
      format_render
      # TODO redirect/render will be unneccesary because of react. 
      # redirect_to quiz_question_path(@question.id)
    else 
      # TODO same as above
      flash[:danger] = "Unable to create question"
    end

  def edit
  end
  
  def update
    puts params
    @question = Question.find params[:id]
    @answers = Answer.where("question_id = #{@question.id}")
    @difficulty = @quiz.difficulty.to_i
    answers_array = params[:answers]
    question = params[:question]

    if @question.update(title: question.title, description: question.description)
      @difficulty.times do |x|
        @answers[x].update(description: answers_array[x].description, correct: answers_array[x].correct)
      end
      @quiz_new = Question.create(quiz_id: @question.quiz_id, user_id: current_user.id)
      @difficulty.times do |x|
        Answer.create(description: x, question_id: @question.id, user_id: current_user.id )
      end
      render json: { quizID: @quiz_new.id, questionID: @question.id }
    else
      render json: { status: 303 }
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :description)
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

end
end
