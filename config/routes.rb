Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/goods" => "goods#index"
  # 업체 목록 api
  get "/centers" => "centers#index"
  # 후원 하기 api
  post "/sponserships" => "sponserships#create"
  # 후원 목록 api
  get "/centers/:id/sponserships" => "centers#show"
  # 후원 수신완료
  put "/sponserships/:id" => "sponserships#update"
  post "/sponserships/:id/results" => "sponserships#results"
end
