class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :content
      t.datetime :date

      t.timestamps
    end
  end
end
