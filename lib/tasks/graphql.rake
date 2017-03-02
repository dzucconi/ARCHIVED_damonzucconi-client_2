require 'graphql/client/http'

namespace :graphql do
  desc 'Dump schema JSON'
  task dump_schema: :environment do
    HTTPAdapter = GraphQL::Client::HTTP.new('http://api.damonzucconi.com/graph')
    Schema = GraphQL::Client.load_schema(HTTPAdapter)
    GraphQL::Client.dump_schema HTTPAdapter, 'db/schema.json'
  end
end
