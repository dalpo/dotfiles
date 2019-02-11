# frozen_string_literal: true

require_relative './base_helper'

module Dotfiles
  # Install Rake tasks for zsh
  class ZshHelper < BaseHelper
    def install
      namespace :zsh do
        desc 'Setup zsh'
        task install: %i[ohmyzsh chsh link theme] do
          puts 'Zsh installed!'
        end

        desc 'Setup Oh my zsh'
        task :ohmyzsh do
          sh 'curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash'
        end

        desc 'Set zsh as default shell'
        task :chsh do
          sh 'chsh -s $(which zsh)'
        end

        desc 'Link zprofile'
        task :link do
          dotfile = home('.zprofile')
          if File.exist? dotfile
            warn "#{dotfile} already exists"
          else
            ln_s File.join('.dotfiles', 'zshfiles', 'zprofile'), dotfile
          end
        end

        desc 'theme'
        task :theme do
          theme_path = home('.zsh_dracula_theme')
          ohmyzsh_theme = home('.oh-my-zsh/themes/dracula.zsh-theme')

          if File.exists?(ohmyzsh_theme)
            warn 'Ohmyzsh dracula theme already configured'
          else
            sh "git clone https://github.com/dracula/zsh.git #{theme_path}"
            ln_s "#{theme_path}/dracula.zsh-theme", ohmyzsh_theme
          end
        end
      end
    end
  end
end
