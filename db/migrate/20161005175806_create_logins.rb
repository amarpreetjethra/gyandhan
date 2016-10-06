class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
