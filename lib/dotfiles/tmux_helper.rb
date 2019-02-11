# frozen_string_literal: true

require 'rake'

module Dotfiles
  # Install Rake tasks for tmux
  class TmuxHelper
    include Rake::DSL

    def self.install_tasks
      new.install
    end

    # rubocop:disable Metrics/MethodLength
    def install
      namespace :tmux do
        desc 'Setup TMUX'
        task :install do
          puts 'Hello tmux!'
        end
      end
    end
  end
end
