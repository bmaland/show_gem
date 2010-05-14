require 'rubygems/gemcutter_utilities'
require 'json/pure' unless defined?(JSON::JSON_LOADED)

class Gem::Commands::ShowCommand < Gem::Command

  include Gem::GemcutterUtilities

  attr_reader :rubygem

  def description
    'Display detailed information about a gem'
  end

  def arguments
    "GEM       gem to show"
  end

  def usage
    "#{program_name} [GEM]"
  end

  def initialize
    super 'show', description
  end

  def execute
    show_gem
  end

  def show_gem
    find(get_one_gem_name)
    rubygem.keys.sort.each { |k| puts "#{k.upcase}: #{rubygem[k]}" }
  end

  def find(name)
    with_response(rubygems_api_request(:get, "api/v1/gems/#{name}.json")) do |r|
      @rubygem = JSON.parse(r.body)
    end
  end

end
