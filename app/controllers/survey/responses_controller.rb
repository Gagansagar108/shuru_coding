class Survey::ResponsesController < ApplicationController

    def create
      user = User.new(params.slice(:name, :email))
   
       response = Response.new(get_params.merge!(user_id))

        unless response.save
            return render json: {message: "somethng_went wrong "}, status: 422
        end 

        render json: {message: "successfull"}, status: 200
    end 

 
    def index 
        page = get_query_filters[:page] || 1
        per = get_query_filters[:per] || 10
    
        query = Response.none

        direct_filters = get_query_filters[:direct_filters]

        query = query.where(direct_filters).page(page).per(per)

        render json: {message: query.as_json}, status: 200
    end 


    def get_params 
        params.permit(:user_id, :survey_id, :survey_question_id, :response)
    end 

    def get_query_filters
         params.permit(:direct_filters, :per, :page)
    end 

end 