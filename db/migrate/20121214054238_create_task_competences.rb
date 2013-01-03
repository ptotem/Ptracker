class CreateTaskCompetences < ActiveRecord::Migration
  def change
    create_table :task_competences do |t|
      t.integer :task_id
      t.integer :competence_id
      t.boolean :difficult, :default => false

      t.timestamps
    end
  end
end
