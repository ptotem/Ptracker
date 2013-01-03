class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :internal
      t.boolean :complete

      t.timestamps
    end
  end
end
