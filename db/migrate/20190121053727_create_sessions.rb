class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :user_agent
      t.string :device_name
      t.string :device_type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
