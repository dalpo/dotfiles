# frozen_string_literal: true

require 'rake'

require_relative './lib/dotfiles/vim_helper'
require_relative './lib/dotfiles/tmux_helper'

Dotfiles::VimHelper.install_tasks
Dotfiles::TmuxHelper.install_tasks

task default: %i[vim:install tmux:install]
