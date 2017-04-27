module SidebarHelper
  def sidebar_state
    cookies[:'Sidebar--open'] == 'true' ? 'Sidebar--open' : ''
  end
end
