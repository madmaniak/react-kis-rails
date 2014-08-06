class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :note
      t.boolean :complete

      t.timestamps
    end
  end
end
