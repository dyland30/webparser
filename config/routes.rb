Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  jsonapi_resources :web_page
  jsonapi_resources :web_page_detail
end
