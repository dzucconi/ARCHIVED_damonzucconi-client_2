class PagesController < ApplicationController
  before_action :fetch_sidebar

  def information; end

  def subscribe; end

  private

  def fetch_sidebar
    @sidebar = query(SidebarQuery, {}, :sidebar)
  end
end
