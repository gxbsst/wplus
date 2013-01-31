API_WINE_TYPE = YAML.load_file("#{Rails.root}/config/api_wine_type.yml")
if Rails.env == 'production'
  SEARCH_WINE_SERVER_URL = "http://www.iwine.com"
else
  SEARCH_WINE_SERVER_URL = "http://127.0.0.1:3300"
end
