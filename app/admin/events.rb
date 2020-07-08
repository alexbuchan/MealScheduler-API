ActiveAdmin.register Event do
  permit_params :title, :date, :begin_at, :end_at, :comments, :user_id, :event_type_id, food_event_attributes: [ :recipe_id ], shopping_event_attributes: [ :date_frequency_id, recipe_ids: [] ]

  form do |f|
    f.inputs "Event" do
      f.input :title
      f.input :user
      f.input :event_type, class: 'event_type'
      f.input :date, label: 'Date', :as => :date_picker
      f.input :begin_at, :as => :time_picker, :step => :quarter_hour
      f.input :end_at, :as => :time_picker
      f.input :comments

      f.inputs 'Food Event', class: 'food-event-form' do
        f.has_many :food_event, new_record: 'Add Recipe', heading: '' do |fe|
          fe.input :recipe
        end
      end

      f.inputs 'Shopping Event', class: 'shopping-event-form' do
        f.has_many :shopping_event, new_record: 'Add Recipe', heading: '' do |se|
          se.input :date_frequency
          se.input :recipes, :as => :check_boxes
        end
      end

      f.actions
    end
  end

  show do
    attributes_table do
      row :title
      row :user
      row :event_type
      row :date
      row :begin_at
      row :end_at
      row :comments
      if event.event_type.name == 'FOOD'
        row :food_event
        row :recipe do |fe|
          fe.food_event.recipe
        end
      end

      if event.event_type.name == 'SHOPPING'
        row :shopping_event
        row :date_frequency do |se|
          se.shopping_event.date_frequency
        end
        row :recipes do |se|
          se.shopping_event.recipes.each { |recipe| recipe }
        end
      end
    end
  end
end
