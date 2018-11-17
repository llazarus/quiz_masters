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
    if @question.update question_params
      format_render
    else
      flash[:danger] = "Unable to edit question"
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :description)
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
