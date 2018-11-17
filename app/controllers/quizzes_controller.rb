class QuizzesController < ApplicationController
  
  def new
    @quiz = Quiz.new
  end


end
