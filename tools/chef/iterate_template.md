Problem
======
Try to setup a nginx  frontend: one  for each node's CPU
Sitting each on a different port


Recipe
======

template "/etc/nginx/sites-available/my-site.conf" do
  variables :frontends_count => node["cpu"]["total"]
end

Template
========
upstream frontends {
<% @frontends_count.times do |i| %>
  server 127.0.0.1:805<%= i + 1 %>;
<% end %>
}


