class CreateMeasureSystems < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_systems do |t|
      t.string :name
    end
  end
end
