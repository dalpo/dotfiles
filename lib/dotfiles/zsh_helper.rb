# frozen_string_literal: true

require 'rake'

module Dotfiles
  # Install Rake tasks for zsh
  class ZshHelper
    def install
      namespace :zsh do
        desc 'Setup zsh'
        task install: %i[ohmyzsh] do
          echo 'Zsh installed!'
        end

        desc 'Setup Oh my zsh'
        task :ohmyzsh do
          sh '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)'
        end
      end
    end
  end
end
