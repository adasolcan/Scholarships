class CreateUserResources < ActiveRecord::Migration
  def change
    create_table :user_resources do |t|

      t.timestamps
    end
  end
end
