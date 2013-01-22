Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :api_wines do
    resources :api_wines, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :api_wines, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :api_wines, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
