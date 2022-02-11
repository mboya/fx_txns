class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController

  def json_resource(klass, record, context = nil)
    JSONAPI::ResourceSerializer.new(klass).object_hash(klass.new(record, context), nil )
  end

  def json_errors(record)
    JSONAPI::Error.new(record)
  end
end
