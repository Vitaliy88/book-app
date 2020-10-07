module V1
  module Entities
    class Book < Grape::Entity
      expose :title, documentation: { type: 'String' }
      expose :description, documentation: { type: 'String' }
      expose :page_count, documentation: { type: 'Integer' }
      expose :publisher, documentation: { type: 'String' }
      expose :categories, documentation: { type: 'String' }
    end
  end
end