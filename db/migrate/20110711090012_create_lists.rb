class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
         t.integer :id, :null => false, :auto_increment=> true, :unsigned => true
         t.string :uuid, :null => false, :default => '', :unique => true
         t.integer :ow, :null => false, :default => 0
         t.string :name, :null => false, :default => ''
         t.integer :sorting, :null => false, :unsigned => true, :default => 0
         t.integer :published, :null => false, :unsigned => true, :default => 0
         t.integer :taskview, :null => false, :default => 0

      t.timestamps
    end
  end
end
