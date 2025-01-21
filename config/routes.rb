Rails.application.routes.draw do
  root "movies#index"

  get "movies", to: "movies#index", as: "movies"
  get "movies/:id", to: "movies#show", as: "movie"
end
