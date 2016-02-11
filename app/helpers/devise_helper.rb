module DeviseHelper
  def devise_error_messages!
    flash_alerts = []
    #error_key = 'errors.messages.not_saved'

    if !flash.empty?
      flash_alerts.push(flash[:error]) if flash[:error]
      flash_alerts.push(flash[:alert]) if flash[:alert]
      flash_alerts.push(flash[:notice]) if flash[:notice]
      #error_key = 'devise.failure.invalid'
    end

    return "" if resource.errors.empty? && flash_alerts.empty?
    errors = resource.errors.empty? ? flash_alerts : resource.errors.full_messages

    messages = errors.map { |msg| content_tag(:li_error, msg) }.join
#    sentence = I18n.t(error_key, :count    => errors.count,
#                                 :resource => resource.class.model_name.human.downcase)

    sentence = I18n.t('errors.messages.not_saved',
                                  count: errors.count,
                                  resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
      <span class="sr-only"></span>
      #{sentence}
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
