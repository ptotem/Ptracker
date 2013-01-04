class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :project_id
      t.boolean :complete
      t.string :type

      t.timestamps
    end
  end
end
