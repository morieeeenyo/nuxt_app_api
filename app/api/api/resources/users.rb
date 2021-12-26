module Resources
  class Users < Grape::API
    namespace :api do
      resource :users do
        # http://localhost:3000/api/users
        desc 'user list'
        get do
          present User.all
        end
      end
    end
  end
end