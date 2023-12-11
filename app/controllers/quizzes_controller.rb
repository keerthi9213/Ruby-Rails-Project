class QuizzesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_quiz, only: [:show]

  def new
    # Set up a new Quiz object if you're using a model to store quiz responses
    @quiz = Quiz.new
  end
  def create
      @quiz = current_user.quizzes.build(quiz_params)
      if @quiz.save
          redirect_to quiz_path(@quiz), notice: 'Quiz was successfully completed.'

        # Handle the successful save
      else
          render :new
        # Handle the failure
      end
  end
  def show
    # The set_quiz before_action will find the quiz based on the id
    @result = @quiz.calculate_results
  end
  
  private
  
  def quiz_params
      params.require(:quiz).permit(:city, :temperature, :number_of_birds, :number_of_species, :species)
  end

  def set_quiz
    @quiz = current_user.quizzes.find_by(id: params[:id])
    unless @quiz
      redirect_to root_path, alert: 'Quiz not found or you do not have permission to view it.'
    end
  end
  


  
  


end   
