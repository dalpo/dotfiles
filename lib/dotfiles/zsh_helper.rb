# frozen_string_literal: true

require_relative './base_helper'

module Dotfiles
  # Install Rake tasks for zsh
  class ZshHelper < BaseHelper
    def install
      namespace :zsh do
        desc 'Setup zsh'
        task install: %i[ohmyzsh chsh link] do
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
      end
    end
  end
end
