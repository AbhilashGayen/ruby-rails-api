Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :weather do
    post 'temperature', to: 'weather#temperature'
    post 'wind', to: 'weather#wind'
    post 'clouds', to: 'weather#clouds'
  end
end
