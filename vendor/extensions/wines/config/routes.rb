Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :wines do
    resources :wines, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :wines, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :wines, :except => :show do
        collection do
          post :update_positions
          get :search_wine
          get :get_wine
          get :get_wine_detail
        end
      end
    end
  end

end
