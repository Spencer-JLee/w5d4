class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :short_url, unique: true
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index(:shortened_urls, :long_url)
    add_index :shortened_urls, :short_url
    add_index :shortened_urls, :user_id
    add_index :shortened_urls, [:long_url, :user_id], unique: true
  end
end
