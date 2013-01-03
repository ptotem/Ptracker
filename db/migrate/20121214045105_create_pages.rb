class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :project_id
      t.string :name
      t.boolean :complete, :default=>false

      t.timestamps
    end
  end
end
