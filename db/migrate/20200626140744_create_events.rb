class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.references  :eventable
      t.string  :eventable_type
      t.string :title
      t.date :date
      t.time :begin_at
      t.time :end_at
      t.string :comments

      t.timestamps
    end
  end
end