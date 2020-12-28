module Eventable
  extend ActiveSupport::Concern

  included do
    has_one :event, :as => :eventable
  end

  def self.all_polymorphic_types(name)
    @poly_hash ||= {}.tap do |hash|
      Dir.glob(File.join(Rails.root, "app", "models", "**", "*.rb")).each do |file|

        klass = File.basename(file, ".rb").camelize.constantize rescue nil
        next unless klass.ancestors.include?(ActiveRecord::Base)

        klass.
          reflect_on_all_associations(:has_one).
          select{ |r| r.options[:as] }.
          each do |reflection|
            (hash[reflection.options[:as]] ||= []) << klass
          end
      end
    end
    @poly_hash[name.to_sym]
  end
end