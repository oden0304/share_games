class CreateEndUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :end_users do |t|
      t.string :name
      t.string :password
      t.string :profile_image

      t.timestamps
    end
  end
end
