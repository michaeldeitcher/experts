module ApplicationHelper
  def init_dialog title
    @jqm_page_data_role = 'dialog'
    @jqm_header_data_theme  = 'd'
    content_for :header do raw '<h1>Sign In</h1>' end
  end
end
