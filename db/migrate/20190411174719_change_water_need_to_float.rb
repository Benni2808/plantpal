class ChangeWaterNeedToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :plants, :waterCurrent, :decimal, precision: 5, scale: 0
    change_column :plants, :waterNeed, :decimal, precision: 5, scale: 0
  end
end
