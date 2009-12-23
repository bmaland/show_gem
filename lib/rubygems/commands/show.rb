class Gem::Commands::ShowCommand < Gem::AbstractCommand

  attr_reader :rubygem

  def description
    'Display detailed information about a gem'
  end

  def arguments
    "GEM       gem to show"
  end

  def usage
    "#{program_name} GEM"
  end

  def initialize
    super 'show', description
    add_proxy_option
  end

  def execute
    setup
    show_gem
  end

  def show_gem
    find(get_one_gem_name)
    rubygem.keys.sort.each { |k| puts "#{k.upcase}: #{rubygem[k]}" }
  end

  def find(name)
    require 'json/pure'

    response = make_request(:get, "gems/#{name}.json")

    case response
    when Net::HTTPSuccess
      begin
        @rubygem = JSON.parse(response.body)
      rescue JSON::ParserError => json_error
        say "There was a problem parsing the data: #{json_error}"
        terminate_interaction
      end
    else
      say "This gem is currently not hosted on Gemcutter."
      terminate_interaction
    end
  end

end
