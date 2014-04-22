# encoding: UTF-8

class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :name, :path
      t.text :desc
      t.integer :view_count, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
