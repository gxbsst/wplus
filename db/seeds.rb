# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed


# Added by Refinery CMS Wines extension
Refinery::Wines::Engine.load_seed

# Added by Refinery CMS Foods extension
Refinery::Foods::Engine.load_seed

# Added by Refinery CMS Drinks extension
Refinery::Drinks::Engine.load_seed


# Added by Refinery CMS Api Wines extension
Refinery::ApiWines::Engine.load_seed

# Added by Refinery CMS Api Foods extension
Refinery::ApiFoods::Engine.load_seed

# Added by Refinery CMS Api Waters extension
Refinery::ApiWaters::Engine.load_seed

# Added by Refinery CMS Api Tasting Flights extension
Refinery::ApiTastingFlights::Engine.load_seed

# Added by Refinery CMS Members extension
Refinery::Members::Engine.load_seed

# Added by Refinery CMS Table Lists extension
Refinery::TableLists::Engine.load_seed
