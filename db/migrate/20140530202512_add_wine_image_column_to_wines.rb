class AddWineImageColumnToWines < ActiveRecord::Migration
  def change
    add_column :wines, :wine_image, :string
  end
end
