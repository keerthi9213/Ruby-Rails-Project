class HomeController < ApplicationController

  def show
    render :show
  end

  def guide
    # You can add any variables that you might want to pass to your guide view
  end

  def community
    @questions = Question.includes(:answers).all
    @new_question = Question.new

  end

end
