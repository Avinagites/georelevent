module Georelevent
  module Models
    class Event < Sequel::Model
      many_to_one :publisher

      plugin :serialization, :geojson, :geom
      plugin :serialization, :json, :properties
      set_allowed_columns *[] # disallow mass-assignment

      def validate
        super
        validates_presence [:title, :geom, :feature_id]
        validates_geometry :geom
        validates_unique [:publisher_id, :feature_id]
      end
    end
  end 
end
