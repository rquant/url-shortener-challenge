class CreateShortUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :short_urls do |t|
      t.string :key, unique: true, index: true
      t.string :original_url
      t.integer :visits

      t.timestamps
    end
  end
end
