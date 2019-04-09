class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :realName
      t.string :nickName
      t.integer :waterNeed
      t.integer :waterCurrent
      t.float :sunNeed
      t.string :place
      t.integer :love

      t.timestamps
    end
  end
end
