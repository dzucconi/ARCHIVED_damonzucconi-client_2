class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :sidebar

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

  def sidebar
    @sidebar = query(SidebarQuery, {}, :sidebar)
  end
end
