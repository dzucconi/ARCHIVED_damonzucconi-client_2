# frozen_string_literal: true

class ExhibitionsController < ApplicationController
  caches_action :index, expires_in: 24.hours

  def index
    params.reverse_merge!(state: %w[SELECTED PUBLISHED])

    @exhibitions = query(ExhibitionsIndexQuery, { state: params.require(:state).map(&:upcase) }, :exhibitions)
  end

  def show
    @exhibition = query(ExhibitionsShowQuery, { id: params.require(:id) }, :exhibition)
  end
end
