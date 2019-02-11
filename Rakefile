# frozen_string_literal: true

require 'rake'

require_relative './lib/dotfiles/vim_helper'
require_relative './lib/dotfiles/tmux_helper'
require_relative './lib/dotfiles/zsh_helper'

Dotfiles::VimHelper.install_tasks
Dotfiles::TmuxHelper.install_tasks
Dotfiles::ZshHelper.install_tasks

task default: %i[vim:install tmux:install zsh:install]
