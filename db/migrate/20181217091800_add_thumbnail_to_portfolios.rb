class AddThumbnailToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :thumbnail, :string
  end
end
