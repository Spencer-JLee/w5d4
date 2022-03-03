class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url, unique: true
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
