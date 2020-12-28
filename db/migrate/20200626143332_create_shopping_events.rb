class CreateShoppingEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_events do |t|
      t.references :date_frequency
    end
  end
end
