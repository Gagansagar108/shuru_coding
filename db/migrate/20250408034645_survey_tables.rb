class SurveyTables < ActiveRecord::Migration[8.0]
  def change
    
    create_table :surveys do |t|
      t.string :name 
      t.boolean :status, default: true 
      t.timestamps 
    end 

    create_table :survey_questions do |t|
      t.references :survey, foreign_key: true
      t.string :question
      t.string :question_type 
      t.json :options 
      t.boolean :status, default: true 
      t.timestamps 
    end 

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :contact 
      t.timestamps 
    end  

    create_table :responses do |t|
      t.references :survey
      t.references :survey_question
      t.references :user
      t.string :response 
      t.timestamps 
    end  
  end
end
