# frozen_string_literal: true

module SidebarHelper
  def sidebar_state
    !touch? && cookies[:'Sidebar--open'] == 'true' ? 'Sidebar--open' : ''
  end
end
