class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :begin_at
      t.time :end_at
      t.string :comments
      t.references :user, index: true
      t.references :event_type, index: true

      t.timestamps
    end
  end
end