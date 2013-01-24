Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :api_waters do
    resources :api_waters, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :api_waters, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :api_waters, :except => :show do
        collection do
          post :update_positions
          post :build_water_item
        end
      end
    end
  end

end
