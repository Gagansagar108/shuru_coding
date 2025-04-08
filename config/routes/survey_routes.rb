namespace :survey  do 
    resources :surveys, only: [:create, :update] do 
    end 

    resources :responses do 
    end 
end 