class AnswersController < ApplicationController

    before_action :authenticate_user!
    before_action :set_question

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params.merge(user: current_user))
        if @answer.save
            redirect_to community_path, notice: 'Answer was successfully posted.'

          # Handle the successful save
        else
            render 'home/community'
          # Handle the failure
        end
    end

    private

    def set_question
        @question = Question.find(params[:question_id])
    end

    def answer_params
        params.require(:answer).permit(:content)
    end
end
