class AddProviderToSession < ActiveRecord::Migration[5.2]
  def change
    add_reference :sessions, :provider, foreign_key: true
  end
end
