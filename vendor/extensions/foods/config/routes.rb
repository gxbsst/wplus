Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :foods do
    resources :foods, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :foods, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :foods, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
