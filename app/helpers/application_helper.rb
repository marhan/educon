module ApplicationHelper

  def create_flash_messages
    html = ""
    flash.each do |type, message|
      alert_class         = map_alert_class_name_for(type)
      flash_message_class = build_flash_element_classes_with(alert_class)
      html << create_flash_message(flash_message_class, type, message)
    end
    html
  end

  private

  def create_flash_message(flash_message_class, type, message)
    capture_haml do
      haml_tag(:div, {:class => flash_message_class, :data => {"alert" => 'alert'}}) do
        haml_tag(:a, {:class => "close", :href => "#"}) do
          haml_concat "x"
        end
        haml_tag(:span, {:class => "flash_message"}) do
          haml_tag(:strong, {:class => "flash_message_type"}) do
            haml_concat type.to_s.capitalize
          end
          haml_tag(:span, {:class => "flash_message_text"}) do
            haml_concat message.to_s
          end
        end
      end
    end
  end

  def build_flash_element_classes_with(alert_class)
    "alert-message #{alert_class} fade in"
  end

  def map_alert_class_name_for(flush_type)
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
