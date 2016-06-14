ActiveModelSerializers.config.adapter = :json_api

api_mime_type = %W(
  application/vnd.api+json
  text/x-json
  application/json
)

Mime::Type.unregister :json
Mime::Type.register 'application/json', :json, api_mime_type
