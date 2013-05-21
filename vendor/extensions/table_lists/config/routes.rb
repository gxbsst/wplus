Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :table_lists do
    resources :table_lists, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :table_lists, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :table_lists, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
