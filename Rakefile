# -*- coding: utf-8 -*-
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "show_gem"
    s.summary = "Gem Command to easily display information about a ruby gem."
    s.description = <<-DESC
      Shows information about a gem, fetched from the Gemcutter site.
    DESC
    s.version = '0.0.2'
    s.email = "bjorn.maeland@gmail.com"
    s.homepage = "http://github.com/bmaland/show_gem"
    s.rubyforge_project = "showgem"
    s.authors = ["Bjørn Arild Mæland"]
    s.has_rdoc = false
    s.files = FileList["[A-Z]*", "{bin,lib,test}/**/*"]

    s.add_dependency 'json_pure', '>= 1.2.0'
    s.add_dependency 'gemcutter', '>= 0.2.1'

    # Testing
    s.test_files = FileList["test/**/*_test.rb"]
    #s.add_development_dependency 'mocha', '~> 0.9.5'
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install jeweler"
end
