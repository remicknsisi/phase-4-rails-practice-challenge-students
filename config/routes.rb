Rails.application.routes.draw do
  post '/instructors', to: 'instructors#create'
  get '/instructors', to: 'instructors#index'
  patch '/instructors/:id', to: 'instructors#update'
  delete '/instructors/:id', to: 'instructors#destroy'

  post '/instructors/:instructor_id/students', to: 'students#create'
  get '/students', to: 'students#index'
  patch '/instructors/:instructor_id/students/:id', to: 'students#update'
  delete '/students/:id', to: 'students#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
