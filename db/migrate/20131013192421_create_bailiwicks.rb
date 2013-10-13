class CreateBailiwicks < ActiveRecord::Migration
  def change
    create_table :bailiwicks do |t|
      t.references :user
      t.references :topic
      t.string :rank
      t.string :affinity
      t.text :reason
      t.timestamps
      t.index [:user_id, :topic_id]
      t.index [:topic_id, :user_id]
    end

  end
end
