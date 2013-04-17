class AddWineIdToApiTastingFlightItems < ActiveRecord::Migration
  def change
    add_column :api_tasting_flight_items, :wine_id, :integer
  end
end
