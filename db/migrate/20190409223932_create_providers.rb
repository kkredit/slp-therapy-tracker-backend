class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :email

      t.timestamps
    end
  end
end
