module ErrorMessageHelper

  def get_devise_error_messages
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count    => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    create_error_message(sentence, messages)
  end

  private

   def create_error_message(sentence, messages)
    capture_haml do
      haml_tag(:div, {
          :id => "error_message",
          :class => "alert block-message error fade in",
          :data => {"alert" => 'alert'}}) do
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

end