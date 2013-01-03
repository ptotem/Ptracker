class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :name
      t.boolean :complete

      t.timestamps
    end
  end
end
