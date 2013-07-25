# encoding: utf-8
class ExportsController < ApplicationController
  EXCEL_TITLES = ['编号', '名称', '所属分类', '价格1', '规格1', '价格2', '规格2', '价格3', '规格3', '价格4', '规格4', '价格5', '规格5']
  def index
    # by bottle
    @wines = ::Refinery::Wines::Wine.order(:sku).where(["bar_category = ?", 'by_btl'])
    # by glass
    @wines2 = ::Refinery::Wines::Wine.order(:sku).where(["bar_category = ? ", 'by_glass'])
    @titles = EXCEL_TITLES
    render :xlsx => 'export_all', 
      :filename => "winelist", :disposition =>  'inline'
  end

  def index2
    @wines = ::Refinery::Wines::Wine.order(:sku).where(["sku < ? ", 1000])
    @titles = EXCEL_TITLES
    render :xlsx => 'index2', 
      :filename => "winelist", :disposition =>  'inline'
  end
end
