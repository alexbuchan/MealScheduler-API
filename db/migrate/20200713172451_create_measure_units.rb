class CreateMeasureUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_units do |t|
      t.string :name
    end
  end
end
