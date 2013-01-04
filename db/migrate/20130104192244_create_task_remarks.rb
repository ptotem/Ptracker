class CreateTaskRemarks < ActiveRecord::Migration
  def change
    create_table :task_remarks do |t|
      t.integer :task_id
      t.text :remark
      t.integer :user_id

      t.timestamps
    end
  end
end
