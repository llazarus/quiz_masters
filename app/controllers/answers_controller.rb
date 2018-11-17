class AnswersController < ApplicationController
  before_action :find_answer, only: [:show, :edit, :update, :destroy]
  def new
    @answer = Answer.new
  end
  
  def create 
    @answer = Answer.new answer_params
    render :text => @answer
    if @answer.save
      # redirect_to answer_path(@answer.id)
    else
      # render :new
    end
  end 
  
  def destroy 
    @answer.destroy
    # redirect_to question_path(@answer.question.id)
  end


  def edit
    @question = Question.find params[:question_id]
  end

  def update 
    if @answer.update answer_params
      # redirect_to question_path(@answer.question.id)
    else
      # render :edit
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

  def find_answer
    @answer = Answer.find params[:id]
  end
end
