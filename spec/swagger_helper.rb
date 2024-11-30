require File.expand_path('../config/environment', __dir__)
require 'rswag/specs'

RSpec.configure do |config|
  config.openapi_root = Rails.root.to_s + '/swagger'

  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {}
    }
  }

  config.openapi_format = :yaml
end