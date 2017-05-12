class ExhibitionsController < ApplicationController
  def index
    params.reverse_merge!(state: ['SELECTED', 'PUBLISHED'])

    @exhibitions = query(ExhibitionsIndexQuery, { state: params.require(:state).map(&:upcase) }, :exhibitions)
  end

  def show
    @exhibition = query(ExhibitionsShowQuery, { id: params.require(:id) }, :exhibition)
  end
end
