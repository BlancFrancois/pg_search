# frozen_string_literal: true

module PgSearch
  class Configuration
    class JsonbColumn < PlainColumn
      def initialize(name, key)
        super(name)
        @key = key.to_s
      end

      def to_sql(connection, *)
        super + "->>#{connection.quote(@key)}"
      end
    end
  end
end
