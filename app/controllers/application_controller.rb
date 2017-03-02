class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class QueryError < StandardError; end

  private

  def query(q, variables = {}, *attributes)
    res = DamonZucconiAPI::Client.query(q, variables: variables)
    if res.errors.any?
      raise QueryError, res.errors[:data].join(', ')
    else
      res.data.values_at(*attributes)
    end
  end
end
