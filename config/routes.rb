Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :categories, except: :show
      get '/show_projects/:id', action: :show_projects, controller: 'users'
      resources :users, except: :destory do
        get '/show_expenses', action: :show_expenses, controller: 'projects'
        resources :projects do
          resources :expenses
        end
      end
      get '/reports/expense_summary', action: :expense_summary, controller: 'reports'
      get '/reports/category_expense', action: :category_expense, controller: 'reports'
      get '/reports/project_expense', action: :project_expense, controller: 'reports'
    end
  end
end
