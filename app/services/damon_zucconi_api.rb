# frozen_string_literal: true

require 'graphql/client'
require 'graphql/client/http'

module DamonZucconiAPI
  HTTP = GraphQL::Client::HTTP.new('http://api.damonzucconi.com/graph')
  Schema = GraphQL::Client.load_schema('db/schema.json')
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)
end
