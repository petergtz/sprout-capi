template "#{node['sprout']['home']}/.direnvrc" do
  source 'direnvrc/direnvrc'
  owner node['sprout']['user']
end

