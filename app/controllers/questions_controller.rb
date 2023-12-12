class QuestionsController < ApplicationController
    before_action :authenticate_user!, except: [:home]
    def create
        @question = current_user.questions.build(question_params)
        if @question.save
            redirect_to community_path, notice: 'Question was successfully created.'

          # Handle the successful save
        else
            render 'home/community'
          # Handle the failure
        end
    end
    
    private
    
    def question_params
        params.require(:question).permit(:content)
    end
end
