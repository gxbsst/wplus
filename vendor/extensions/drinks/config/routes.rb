Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :drinks do
    resources :drinks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :drinks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :drinks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
