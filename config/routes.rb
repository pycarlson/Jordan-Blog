JordanBlog::Application.routes.draw do
  
  devise_for :users
  resources :posts do 
    resources :comments, only: [:new, :create]
  end

  resources :categories, except: [:show, :edit]
  get '/blog_admin' => 'blog_admin#blog_admin', :as => :blog_admin
  get '/about' => 'static_pages#about', :as => :about
  get '/archives' => 'static_pages#archives', :as => :archives


  root :to => "posts#index" 
end
