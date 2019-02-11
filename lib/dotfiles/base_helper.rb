# frozen_string_literal: true

require 'rake'

module Dotfiles
  # base dotfiles helper class
  class BaseHelper
    include Rake::DSL

    def self.install_tasks
      new.install
    end

    private

    def home(path = '')
      File.join ENV['HOME'], path
    end
  end
end
