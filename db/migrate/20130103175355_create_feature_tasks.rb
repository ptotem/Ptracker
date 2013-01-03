class CreateFeatureTasks < ActiveRecord::Migration
  def change
    create_table :feature_tasks do |t|
      t.integer :task_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
