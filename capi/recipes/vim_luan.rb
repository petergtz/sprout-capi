package 'vim'
homebrew_cask 'macvim'

vimfiles = ::File.join(node['sprout']['home'], node['workspace_directory'], 'vimfiles')
git vimfiles do
  repository 'http://github.com/luan/vimfiles.git'
  revision 'master'
  user node['sprout']['user']
  enable_submodules true
  action :checkout
end

dotvim = ::File.join(node['sprout']['home'], '.vim')

link dotvim do
  to vimfiles
  owner node['sprout']['user']
end

vimrc_local_path = ::File.join(node['sprout']['home'], '.vimrc.local')

cookbook_file vimrc_local_path do
  source "vim_luan/.vimrc.local"
  user node['sprout']['user']
  mode "0644"
end

vimrc_local_plugins_path = ::File.join(node['sprout']['home'], '.vimrc.local.plugins')

cookbook_file vimrc_local_plugins_path do
  source "vim_luan/.vimrc.local.plugins"
  user node['sprout']['user']
  mode "0644"
end

execute './update --non-interactive' do
  cwd dotvim
  user node['sprout']['user']
end
