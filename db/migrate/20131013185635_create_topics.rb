class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :type
      t.string :name
      t.index :name
      t.timestamps
    end
  end
end
