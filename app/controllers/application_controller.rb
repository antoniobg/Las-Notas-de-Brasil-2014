require 'will_paginate/array'

class ApplicationController < ActionController::Base
  include SessionsHelper
  include PlayersHelper
  include GeneralHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_visits

  def set_visits
    if cookies[:visits].nil? and !signed_in?
      num_visits = 0
    else
      num_visits = 1
    end
    cookies.permanent[:visits] = { 
      value: num_visits, 
      expires: 1.day.from_now 
    }
  end
end
