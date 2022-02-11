JSONAPI.configure do |config|
  config.resource_key_type = :uuid
  config.default_paginator = :paged

  config.default_page_size = 10
  config.maximum_page_size = 20
end
