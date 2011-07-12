class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
          t.integer :id, :null => false, :auto_increment=> true, :unsigned => true
          t.string :uuid, :null => false, :default => '', :unique => true
          t.integer :list_id, :null => false, :unsigned => true, :default => 0, :key => true
          t.date :d_completed, :unsigned => true, :default => 0
          t.integer :compl, :null => false, :unsigned => true, :default => 0
          t.string :title, :null => false
          t.string :note
          t.integer :prio, :null => false, :default => 0
          t.string :ow, :null => false, :default => 0
          t.string :tags_ids, :null => false, :default => ''
          t.date :duedate

      t.timestamps
    end
  end
end
