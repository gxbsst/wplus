class ApiWines < ActiveRecord::Migration
  def up
    create_table :api_wines do |t|
      t.string :wine_id
      t.string :type
      t.string :vintage        
      t.string :name_en
      t.string :name_zh
      t.string :region                       
      t.string :wine_style                   
      t.string :capacity
      t.string :alcoholicity
      t.string :variety                      
      t.string :rating, :limit => 11         
      t.string :rating_rp, :limit => 11      
      t.string :rating_ws, :limit => 11      
      t.string :rating_jr, :limit => 11      
      t.float  :price                        
      t.string :info                         
      t.string :cellar_num, :limit => 11     
      t.string :cellar_location, :limit => 11
      t.string :slug, :limit => 11           
      t.string :image                  
      t.timestamps                           
    end                                      
  end                                        

  def down                                   
    drop_table :api_wines              
  end                                        
end                                          
