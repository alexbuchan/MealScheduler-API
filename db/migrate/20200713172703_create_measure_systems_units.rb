class CreateMeasureSystemsUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_systems_units do |t|
      t.belongs_to :measure_system
      t.belongs_to :measure_unit
    end
  end
end
