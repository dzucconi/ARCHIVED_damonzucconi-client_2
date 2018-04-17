# frozen_string_literal: true

# encode: UTF-8

require 'csv'
require 'open-uri'

class PagesController < ApplicationController
  def information; end

  def subscribe; end

  def cv
    url = "https://docs.google.com/spreadsheets/d/#{ENV['GOOGLE_SHEETS_CV_KEY']}/pub?output=csv"
    csv = RemoteCSV.new(url)
    @cv = CV.new(csv)
  end
end
