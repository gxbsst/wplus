# encoding: utf-8
require 'net/http'
require 'will_paginate/array'
module Refinery
  module Wines
    module Admin
      class WinesController < ::Refinery::AdminController

        crudify :'refinery/wines/wine',
                :title_attribute => 'vintage', :xhr_paging => true


        def new
          @wine = Refinery::Wines::Wine.new
        end

        def search_wine

        end

        def get_wine
          query_param = params.slice('word').to_query
          uri = URI("#{SEARCH_WINE_SERVER_URL}/api/search_wines?#{query_param}")
          result = Net::HTTP.get(uri)
          @wine_info = JSON.parse result
          page = params[:page] || 1
          @wine_info = @wine_info.paginate(:page => page, :per => 5)
        end

        def get_wine_detail
          query_param = params.slice('wine_detail_id').to_query
          uri = URI("#{SEARCH_WINE_SERVER_URL}/api/search_wines/get_wine_detail?#{query_param}")
          result = Net::HTTP.get(uri)
          wine_info = JSON.parse result
          init_wine(wine_info)
          render :new
        end

        private

        def get_rating(wine_info, type)
          score = nil
          wine_info['special_comments'].each {|h| score = h['score'] if h.has_value?(type)} if wine_info['special_comments']
          score
        end

        def get_style_id(wine_info)
          if wine_info['wine']['style']
            style = WineStyle.find_by_name_en(wine_info['wine']['style']['name_en'])
            style.try(:id)
          end
        end

        def init_wine(wine_info)
          @wine = Refinery::Wines::Wine.new(
            :name_en => wine_info['wine']['name_en'],
            :name_zh => wine_info['wine']['name_zh'],
            :wine_style_id => get_style_id(wine_info),
            :info => wine_info['description'],
            :vintage => wine_info['show_year'],
            :region => "#{wine_info['wine']['region_path_zh']}  #{wine_info['wine']['region_path_en']}",
            :capacity => wine_info['capacity'],
            :alcoholicity => wine_info['alcoholicity'],
            :variety => wine_info['show_region_percentage'],
            :rating_rp => get_rating(wine_info, "RP"),
            :rating_jr => get_rating(wine_info, "JR")
          )
        end
                
      end
    end
  end
end
