class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.float :latitude
      t.float :longitude
      t.float :radius
      t.float :current_lat
      t.float :current_longitude
      t.boolean :is_in_zone

      t.timestamps
    end
  end
end
