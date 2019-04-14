Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'image#show'
      get '/forecast', to: 'forecast#show'
    end
  end

end
