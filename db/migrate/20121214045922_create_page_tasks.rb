class CreatePageTasks < ActiveRecord::Migration
  def change
    create_table :page_tasks do |t|
      t.integer :page_id
      t.integer :task_id
      t.boolean :complete, :default=>false

      t.timestamps
    end
  end
end
