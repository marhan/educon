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


  def flash_messages
    flash.each do |type, message|
      alert_class = alert_class_name_for(type)
      capture_haml do
        haml_tag :div, :class => "alert-message #{alert_class} fade in", :data => {"alert" => 'alert'} do
          haml_tag :a, :class => "close", :href => "#" do
            "x"
          end
          haml_tag :p do
            haml_tag :strong do
              "type".capitalize.humanize
            end
            haml_tag :div do
              "message"
            end
          end
        end
      end
    end
  end
end
