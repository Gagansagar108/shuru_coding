namespace :survey  do 
    resources :surveys, only: [:create, :update] do 
    end 

    resources :responses, only: [:create, :update] do 
    end 
end 