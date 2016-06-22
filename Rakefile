require "bundler"

Bundler.setup

task :default => %w(run)

task :run do

  # Make sure our project dir is on path
  $: << File.dirname(__FILE__)

  require 'lib/main.rb'

end
