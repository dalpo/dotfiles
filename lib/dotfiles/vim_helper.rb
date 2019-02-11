# frozen_string_literal: true

require 'rake'

module Dotfiles
  # Install Rake tasks for vim
  class VimHelper
    include Rake::DSL

    def self.install_tasks
      new.install
    end

    # rubocop:disable Metrics/MethodLength
    def install
      namespace :vim do
        desc 'Setup VIM'
        task :install do
          puts 'Hello vim!'
        end
      end
    end
  end
end
