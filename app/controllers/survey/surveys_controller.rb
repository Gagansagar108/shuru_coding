class Survey::SurveysController < ApplicationController
    def create 
        binding.pry
        survey_params = get_params[:survey]

        ActiveRecord::Base.transaction do 
            survey = Survey.new(survey_params)

            unless survey.save
                return render json: { message: 'something went wrong'}, status: 422
            end 
            
            survey_question_params = survey_params[:survey_questions]

            survey_question_params.each do |params|
                question = survey.questions.new(params)
                question.save
            end 
        end 
    end 


    def get_params
        params.require(:survey).permit(survey_questions: [])
    end 
end 