class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due
      t.integer :interval

      t.timestamps null: false
    end
  end
end
