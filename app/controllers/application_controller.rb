class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_jquery_mobile_page_defaults

  private
  def initialize_jquery_mobile_page_defaults
    @jqm_page_data_role = 'page'
    @jqm_header_data_theme = "a"
  end
end
