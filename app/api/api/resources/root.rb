module Resources
  class Root < Grape::API
    format :json
    content_type :json, 'application/json'
  
    mount ::Resources::Users
  
    # V1::Rootの末尾に追記
    add_swagger_documentation(
      doc_version: '1.0.0',
      base_path: '',
      hide_documentation_path: true,
      hide_format: true,
      info: {
        title: 'nuxt_api',
        description: 'nuxt_apiのAPIドキュメント'
      }
    )
  end
end