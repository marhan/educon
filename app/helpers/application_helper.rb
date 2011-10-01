module ApplicationHelper

  def get_devise_error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count    => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    create_error_message(sentence, messages)
  end

  def get_flash_messages
    html = ""
    flash.each do |type, message|
      class_name         = map_alert_class_name_for(type)
      html << create_flash_message(class_name, type, message)
    end
    html
  end

  private

  def create_flash_message(class_name, type, message)
    capture_haml do
      haml_tag(:div, {:class => "alert-message #{class_name} fade in", :data => {"alert" => 'alert'}}) do
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

  def create_error_message(sentence, messages)
    capture_haml do
      haml_tag(:div, {:class => "alert-message block-message error fade in", :data => {"alert" => 'alert'}}) do
        haml_tag(:a, {:class => "close", :href => "#"}) do
          haml_concat "x"
        end
        haml_tag(:div) do
          haml_tag(:strong) do
            haml_concat sentence
          end
        end
        haml_tag(:ul) do
          messages.map { |msg|
            haml_tag(:li) do
              haml_concat msg
            end
          }
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
