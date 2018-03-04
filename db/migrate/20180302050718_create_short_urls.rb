class CreateShortUrls < ActiveRecord::Migration[5.0]
  def change
    create_table :short_urls do |t|
      t.string :slug, null: false, unique: true, index: true
      t.string :original_url, null: false
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end
