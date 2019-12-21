class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string  :title
      t.boolean :released
      t.integer :release_year
      t.text_field :artist_name
      t.text_field :genre

      t.timestamps
    end
  end
end
