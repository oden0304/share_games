class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :fovorite_id
      t.integer :genre_id
      t.text :text

      t.timestamps
    end
  end
end
