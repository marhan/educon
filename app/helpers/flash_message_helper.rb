module FlashMessageHelper

  def get_flash_messages
    html = ""
    flash.each do |type, message|
      class_name = map_alert_class_name_for(type)
      html << create_flash_message(class_name, type, message)
    end
    html
  end

  private

  def create_flash_message(class_name, type, message)
    capture_haml do
      haml_tag(:div, {
          :id    => "flash_message",
          :class => "alert alert-#{class_name} fade in",
          :data  => {"dismiss" => 'alert'}}) do
        haml_tag(:a, {:class => "close", :href => "#"}) do
          haml_concat "x"
        end
        haml_tag(:span, {:class => "flash_message"}) do
          haml_tag(:strong, {:class => "flash_message_type"}) do
            haml_concat I18n.t("flash.message.type.#{type}")
          end
          haml_tag(:span, {:class => "flash_message_text"}) do
            haml_concat message.to_s
          end
        end
      end
    end
  end

  def map_alert_class_name_for(type)
    flush_type = type.to_s
    if flush_type == "success"
      return "success"
    elsif flush_type == "notice"
      return "info"
    elsif flush_type == "alert"
      return "warning"
    elsif flush_type == "error"
      return "error"
    end
  end

end