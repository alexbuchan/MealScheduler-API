class CreateMeasureUnitTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_unit_types do |t|
      t.string :unit_type
    end
  end
end
