Rails.application.routes.draw do

  root 'pages#about'

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts, except: [:index, :edit, :new] do
    resources :comments, only: [:create, :destroy]
  end
  resources :projects, except: [:index, :edit, :new]
  resources "contacts", only: :create

  devise_for :admin, only: :sessions

  get 'admin' => 'admin#home'
  get 'admin/projects' => 'admin#projects'
  get 'admin/posts' => 'admin#posts'
  get 'admin/comments' => 'admin#comments'
  get 'admin/projects/new' => 'projects#new', as: :new_project
  get 'admin/projects/:id/edit' => 'projects#edit', as: :edit_project
  get 'admin/posts/new' => 'posts#new', as: :new_post
  get 'admin/posts/:id/edit' => 'posts#edit', as: :edit_post
  get 'download_cv' => 'pages#download_cv'

  #Public routes
  get 'contact' => 'contacts#new', as: :contact
  get 'about' => 'pages#about'
  get 'portfolio' => 'pages#portfolio'
  get 'portfolio/:id' => 'projects#show', as: :app
  get 'blog' => 'pages#blog'
  get 'blog/:id' => 'posts#show', as: :article
  get 'tags/:tag' => 'pages#blog', as: :tag




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
