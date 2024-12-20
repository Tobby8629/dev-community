class CreateConnections < ActiveRecord::Migration[7.2]
  def change
    create_table :connections do |t|
      t.references :user, null: false, foreign_key: true
      t.string :connected_user
      t.string :status

      t.timestamps
    end
  end
end
