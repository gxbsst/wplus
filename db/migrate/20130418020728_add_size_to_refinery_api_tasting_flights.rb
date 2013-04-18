class AddSizeToRefineryApiTastingFlights < ActiveRecord::Migration
  def change
    add_column :refinery_api_tasting_flights, :size, :string
  end
end
