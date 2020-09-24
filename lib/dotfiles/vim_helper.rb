# frozen_string_literal: true

require_relative './base_helper'

module Dotfiles
  # Install Rake tasks for vim
  class VimHelper < BaseHelper
    VIM_PLUG_INSTALL_URL = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    VIM_PLUG_CONF = '.local/share/nvim/site/autoload/plug.vim'

    # rubocop:disable Metrics/MethodLength
    def install
      namespace :vim do
        desc 'Setup VIM'
        task install: %i[vim_plug link plugins] do
          puts 'Vim installed!'
        end

        desc 'Install Vim Plug'
        task :vim_plug do
          conf_path = home(VIM_PLUG_CONF)
          warn 'Upgrading Vim Plug...' if File.exist? conf_path
          sh "curl -fLo #{conf_path} --create-dirs #{VIM_PLUG_INSTALL_URL}"
        end

        desc '[Deprecated] Install Vundle'
        task :vundle do
          if File.exist? home('.vim/bundle/Vundle.vim')
            warn 'Vundle already installed'
          else
            mkdir_p home('.vim/bundle/')
            sh 'git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
          end
        end

        desc 'Make ~/.vimrc symlink'
        task :link do
          dotfile = home('.vimrc')
          if File.exist? dotfile
            warn "#{dotfile} already exists"
          else
            ln_s File.join('.dotfiles', 'vimfiles', 'vimrc'), dotfile
          end
        end

        desc 'Install Vundle plugins'
        task :plugins do
          sh "vim -c 'PluginInstall' -c 'qa!'"
        end
      end
    end
  end
end
