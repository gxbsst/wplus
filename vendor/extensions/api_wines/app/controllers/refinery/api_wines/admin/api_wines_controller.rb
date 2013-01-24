#encoding: utf-8
module Refinery
  module ApiWines
    module Admin
      class ApiWinesController < ::Refinery::AdminController

        crudify :'refinery/api_wines/api_wine',
                :title_attribute => 'type', :xhr_paging => true
        before_filter :check_wine_id_and_api_type, :only => :build_api

        def index
          @api_wines = Refinery::ApiWines::ApiWine.order('id desc')
          if params[:type]
            @api_wines = @api_wines.send(params[:type])
          end
          page = params[:page] || 1
          @api_wines = @api_wines.paginate(:page => page, :per_page => 4)
        end


        def build_api
        	wines = Refinery::Wines::Wine.find(params[:wine][:ids])
        	@api_wines = []
          wines.each do |wine|
            api_wine = Refinery::ApiWines::ApiWine.where(:name_en => wine.name_en, :type => @class_type).
                                                  first_or_initialize
            if api_wine.new_record?
              api_wine.init(wine)
              api_wine.save
            end
            @api_wines << api_wine
          end
        	render :new
      	end

        def edit
          api_wine = Refinery::ApiWines::ApiWine.find(params[:id])
          @api_wine = api_wine.becomes Refinery::ApiWines::ApiWine
        end

        def update
          api_wine = Refinery::ApiWines::ApiWine.find(params[:id])
          @api_wine = api_wine.get_parent
          @api_wine.update_attributes(params[:api_wine])
          flash[:notice] = "更新成功"
          redirect_to refinery.api_wines_admin_api_wines_path
        end

      	def create
      		if params[:api_wine]
      			params[:api_wine].each do |api_wine|
      				api_wine_arr = api_wine.flatten
      				api_wine = Refinery::ApiWines::ApiWine.find api_wine_arr.first
      				api_wine.price = api_wine_arr[1][:price]
      				api_wine.sku  = api_wine_arr[1][:sku] #通过更改name_en间接自动改变slug，保持name_en 和
      				api_wine.save
      			end
      		end
      		flash[:notice] = "创建成功"
      		redirect_to refinery.api_wines_admin_api_wines_path
      	end

        def destroy
          api_wine = Refinery::ApiWines::ApiWine.find(params[:id])
          @api_wine = api_wine.get_parent
          @api_wine.destroy
          respond_to do |format|
            format.js
            format.html {redirect_to refinery.api_wines_admin_api_wines_path}
          end
        end

      	private

      	def check_wine_id_and_api_type
      		if params[:wine][:ids].blank? || params[:wine][:api_type].blank?
      			flash[:error] = "种类和酒必须不能为空!"
      			redirect_to refinery.wines_admin_wines_path
      		end 

          @class_type = "Refinery::ApiWines::#{params[:wine][:api_type]}"
          unless @class_type.safe_constantize
            flash[:error] = "非法请求"
            redirect_to refinery.wines_admin_wines_path
          end
      	end
      end
    end
  end
end
