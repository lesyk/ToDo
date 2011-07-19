class CreateTodolists < ActiveRecord::Migration
  def change
    create_table :todolists do |t|
          t.integer :id, :null => false, :auto_increment=> true, :unsigned => true
          t.integer :list_id, :null => false, :unsigned => true, :default => 0, :key => true
          t.integer :compl, :null => false, :unsigned => true, :default => 0
          t.string :title, :null => false
          t.string :note
          t.integer :prio, :null => false, :default => 0
          t.date :duedate
          t.date :d_completed, :unsigned => true, :default => 0

      t.timestamps
    end
  end
end
