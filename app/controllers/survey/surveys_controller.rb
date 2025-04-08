class Survey::SurveysController < ApplicationController
    def create 
        survey_params = get_params[:servey]

        ActiveRecord::Base.transaction do 
            survey = Survey.new(survey_params)

            unless survey.save
                return render json: { message: 'something went wrong'}, status: 422
            end 
            
            survey_question_params = survey_params[:servey_questions]

            survey_question_params.each do |params|
                question = SurveyQuestion.new(params)
                question.save
            end 
        end 
    end 


    def get_params
        params.require(:servey).permit(servey_questions: [])
    end 
end 