class CreateJoinTableHashtagsPortfolios < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hashtags, :portfolios do |t|
      # t.index [:hashtag_id, :portfolio_id]
      # t.index [:portfolio_id, :hashtag_id]
    end
  end
end
