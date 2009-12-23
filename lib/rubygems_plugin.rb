$:.unshift File.dirname(__FILE__)     # For use/testing when no gem is installed

require 'rubygems/command_manager'
require 'rubygems/commands/show'

Gem::CommandManager.instance.register_command :show
