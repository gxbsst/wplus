Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :api_tasting_flights do
    resources :api_tasting_flights, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :api_tasting_flights, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :api_tasting_flights, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
