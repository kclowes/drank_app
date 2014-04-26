class CreatingWinesTableForAttributes < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :wine_fruit_taste
      t.string :wine_sweetness
      t.string :wine_body
      t.string :wine_vintage
      t.string :wine_abv
      t.string :wine_overall_rating
    end
  end
end
