ActiveAdmin::Dashboards.build do

  section "Newest Users", :priority => 1 do
    table_for User.order('created_at desc').limit(10).each do |user|
      column(:firstname) { |user| link_to(user.firstname, admin_user_path(user)) }
      column(:lastname) { |user| link_to(user.lastname, admin_user_path(user)) }
      column(:email) { |user| link_to(user.email, admin_user_path(user)) }
    end
  end

  section "Sidebar Demo", :priority => 2 do
    div do
      
    end
  end

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.

  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end

  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
