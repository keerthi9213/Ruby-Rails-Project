class QuizzesController < ApplicationController
  before_action :authenticate_user!
  def new
    # Set up a new Quiz object if you're using a model to store quiz responses
    @quiz = Quiz.new
  end
  def create
      @quiz = current_user.quizzes.build(quiz_params)
      if @quiz.save
          redirect_to guide_path, notice: 'Quiz was successfully completed.'

        # Handle the successful save
      else
          render :new
        # Handle the failure
      end
  end
  
  private
  
  def quiz_params
      params.require(:quiz).permit(:city, :temperature, :number_of_birds, :number_of_species)
  end
end
