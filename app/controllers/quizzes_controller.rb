class QuizzesController < ApplicationController
  def new
    # Set up a new Quiz object if you're using a model to store quiz responses
    @quiz = Quiz.new
  end

  def create
    # Logic to handle the quiz submission
    # This might involve creating a Quiz model instance with the submitted data
    @quiz = Quiz.new(quiz_params)
    
    if @quiz.save
      flash[:success] = "Thank you for completing the quiz!"
      redirect_to home_path
      # Redirect to a 'thank you' page or display a success message
    else
      # Re-render the :new template with error messages
      render :new
    end
  end

  private

  #def quiz_params
    # Strong parameters for quiz submission
    #params.require(:quiz).permit(:city, :temperature, :number_of_birds, :number_of_species, :species)
  #end
  

end
