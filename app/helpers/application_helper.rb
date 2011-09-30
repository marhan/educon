module ApplicationHelper

  @alert_type

  def alert_class_name_for(flush_type)
    puts "flush type: #{flush_type}"
    if flush_type == "success"
      @alert_type = "success"
    elsif flush_type == "notice"
      @alert_type = "info"
    elsif flush_type == "alert"
      @alert_type = "warning"
    elsif flush_type == "error"
      @alert_type = "error"
    end
    @alert_type
  end


  def create_flash_messages
    flash.each do |type, message|
      alert_class = alert_class_name_for("alert")
      create_flash_message(alert_class, type, message)
    end
  end

  def create_flash_message(alert_class, type, message)
    haml_tag(:div, {:class => "alert-message #{alert_class} fade in", :data => {"alert" => 'alert'}}) do
      haml_tag(:a, {:class => "close", :href => "#"}) do
        haml_concat "x"
      end
      haml_tag :p do
        haml_tag :strong, type.capitalize.to_s
        haml_tag :div, message.to_s
      end
    end
  end
end
