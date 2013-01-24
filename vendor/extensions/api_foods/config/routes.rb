Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :api_foods do
    resources :api_foods, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :api_foods, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :api_foods, :except => :show do
        collection do
          post :update_positions
          post :build_food_item
        end
      end
    end
  end

end
