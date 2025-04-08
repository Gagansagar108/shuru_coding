class Survey::SurveysController < ApplicationController
    def create 
        binding.pry
        survey_params = get_params.slice(:name).as_json

        ActiveRecord::Base.transaction do 
            survey = Survey.new(survey_params)

            unless survey.save
                return render json: { message: 'something went wrong'}, status: 422
            end 
            
            survey_question_params = get_params[:servey_questions].as_json

            survey_question_params.each do |params|
                question = survey.survey_questions.new(params)
                question.save
            end 
        end 
    end 


    def get_params
        params.require(:survey).permit(
    :name,
    servey_questions: [:question, :question_type]
  )
    end 
end 