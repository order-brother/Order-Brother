class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :title
      t.string :name
      t.string :phone
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
