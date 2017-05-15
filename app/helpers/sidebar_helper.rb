module SidebarHelper
  def sidebar_state
    !touch? && cookies[:'Sidebar--open'] == 'true' ? 'Sidebar--open' : ''
  end
end
