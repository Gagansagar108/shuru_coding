namespace :survey  do 
    resources :survey only [:create, :update] do 
    end 

    resources :response only [:create, :update] do 
    end 
end 