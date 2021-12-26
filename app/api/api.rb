class Api < Grape::API
  # urlの第１セグメント名 ex) http://localhost/api/
  prefix 'api'
  mount Resources::Root
end