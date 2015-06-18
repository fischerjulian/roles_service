class AddEstimatedDurationToTasks < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.integer :estimated_duration
    end
  end
end
