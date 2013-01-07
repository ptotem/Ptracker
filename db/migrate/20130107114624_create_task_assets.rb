class CreateTaskAssets < ActiveRecord::Migration
  def change
    create_table :task_assets do |t|
      t.integer :task_id

      t.timestamps
    end
  end
end
