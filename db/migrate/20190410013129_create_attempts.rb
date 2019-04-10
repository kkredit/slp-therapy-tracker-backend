class CreateAttempts < ActiveRecord::Migration[5.2]
  def change
    create_table :attempts do |t|
      t.integer :number
      t.integer :status

      t.timestamps
    end
  end
end
