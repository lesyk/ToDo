class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists,  :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
         t.integer :id, :null => false, :auto_increment=> true, :unsigned => true
         t.string :name, :null => false, :default => ''
         t.integer :sorting, :unsigned => true, :default => 0
         t.integer :published, :unsigned => true, :default => 0
         t.integer :taskview, :default => 0

      t.timestamps
    end
  end
end
