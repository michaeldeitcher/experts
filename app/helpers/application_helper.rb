module ApplicationHelper
  def init_dialog title
    @jqm_page_data_role = 'dialog'
    @jqm_header_data_theme  = 'd'
    content_for :header do raw "<h1>#{title}</h1>" end
  end

  def session_link
    if current_user
      link_to('Logout', destroy_user_session_path, :method => :delete)
    else
      link_to('Login', new_user_session_path, 'data-rel'=>"dialog")
    end
  end

  def error_messages resource
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
