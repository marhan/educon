module ApplicationHelper

  def get_top_bar_menu_item(name, path)
    active = current_path?(path) == true ? 'active' : nil
    create_top_bar_menu_item(active, name, path)
  end

  private
  
  def current_path?(path)
    sign_in = path == root_path && path_info() == new_user_session_path
    #sign_in = false;
    path_info() == path || sign_in
  end

  def path_info
    request.env['PATH_INFO']
  end

  def create_top_bar_menu_item(active, name, path)
    capture_haml do
      haml_tag('li', :class => active) do
        haml_tag(:a, {:href => path}) do
          haml_concat name
        end
      end
    end
  end


end
