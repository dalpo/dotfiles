# frozen_string_literal: true

require_relative './base_helper'

module Dotfiles
  # Install Rake tasks for vim
  class VimHelper < BaseHelper
    # rubocop:disable Metrics/MethodLength
    def install
      namespace :vim do
        desc 'Setup VIM'
        task install: %i[vundle link plugins] do
          puts 'Vim installed!'
        end

        desc 'Install Vundle'
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
