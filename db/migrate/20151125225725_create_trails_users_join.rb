class CreateTrailsUsersJoin < ActiveRecord::Migration
  
  def up
    create_table :trails_users, :id => false do |t|
      t.integer :trail_id
      t.integer :user_id
    end
    add_index :trails_users, [:trail_id, :user_id]
  end

  def down
    drop_table :trails_users
  end

end
