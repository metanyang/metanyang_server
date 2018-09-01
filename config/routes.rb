Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/goods" => "goods#index"
  get "/centers" => "centers#index"
  post "/sponserships" => "sponserships#create"
  get "/centers/:id/sponserships" => "centers#show"
  put "/sponserships/:id" => "sponserships#update"
  post "/sponserships/:id/results" => "sponserships#results"
end
