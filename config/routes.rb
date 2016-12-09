Rails.application.routes.draw do
  resources :topics do
    resources :posts,except: [:index]
  end

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]



  #we can refactor all of the GET methods for Post with the below
  #get 'post/index'
  #get 'post/show'
  #get 'post/new'
  #get 'post/edit'




  #we don't need get welcome/index because it's the root
  #get 'welcome/index'

  #get 'welcome/about'
  #this line directs to /about rather than welcome/about
  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
