class CreateDateFrequencies < ActiveRecord::Migration[6.0]
  def change
    create_table :date_frequencies do |t|
      t.string :name
      t.timestamps
    end
  end
end
