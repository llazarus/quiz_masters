class QuestionsController < ApplicationController
  def new 
    # Question will initially be created without title or
    # description. It will only have the PK which is id.
    @question = Question.new
    @quiz = Quiz.find params[:quiz_id]
    @question.quiz = @quiz
    @question.user = current_user

    if @quiz.user == current_user && @question.save
      # render json: question
      respond_to do |format|
        format.html { render } # this will render `views/questions/index.html.erb`
        format.json { render json: @question }
      end
      # TODO redirect/render will be unneccesary because of react. 
      # redirect_to quiz_question_path(@question.id)
    else 
      # TODO same as above
      flash[:danger] = "Unable to create question"
    end
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end


end
