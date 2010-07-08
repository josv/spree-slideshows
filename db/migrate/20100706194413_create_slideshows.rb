class CreateSlideshows < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.string :name
      t.string :locale
      t.string :url
      t.integer :position
      t.boolean :enabled
      t.boolean :included
      t.string :groups

      t.string :img_file_name
      t.string :img_content_type
      t.integer :img_file_size
      t.datetime :img_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
  end
end
