# frozen_string_literal: true

require_relative './base_helper'

module Dotfiles
  # Install Rake tasks for tmux
  class TmuxHelper < BaseHelper
    # rubocop:disable Metrics/MethodLength
    def install
      namespace :tmux do
        desc 'Setup TMUX'
        task install: %i[link] do
          puts 'Tmux installed!'
        end

        desc 'Link tmux configuration'
        task :link do
          dotfile = home('.tmux.conf')
          if File.exist? dotfile
            warn "#{dotfile} already exists"
          else
            ln_s File.join('.dotfiles', 'tmuxfiles', 'tmux.conf'), dotfile
          end
        end
      end
    end
  end
end
