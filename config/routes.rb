Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/edit'

  #we can refactor all of the GET methods for Post with the below
  #get 'post/index'
  #get 'post/show'
  #get 'post/new'
  #get 'post/edit'

  resources :posts


  #we don't need get welcome/index because it's the root
  #get 'welcome/index'

  #get 'welcome/about'
  #this line directs to /about rather than welcome/about
  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
