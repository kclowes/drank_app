class AddCollectionsTable < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.index :user_id
      t.integer :wine_id
      t.index :wine_id
    end
  end
end
