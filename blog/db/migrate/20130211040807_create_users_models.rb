class CreateUsersModels < ActiveRecord::Migration
  def change
    create_table :users_models do |t|
      t.string :user
      t.string :password
      t.integer :count

      t.timestamps
    end
  end
end
