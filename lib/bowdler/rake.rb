require 'json'
require 'bowdler/simple_dsl'

module Bowdler
  class Rake
    DEPENDENCY_FILES = %w{Bowerfile}.freeze

    def initialize(options)
      @options = options
    end

    def dependency_file
      entries = Dir.entries(Dir.pwd)
      DEPENDENCY_FILES.detect { |file| entries.include?(file) }
    end

    def perform
      case dependency_file
        when 'Bowerfile'  then perform_simple_dsl('Bowerfile')
      end
    end

    def perform_simple_dsl(file)
      dsl = Bowdler::SimpleDsl.evalute(file)

      dsl.write_bower_json
      dsl.write_dotbowerrc

      system(command)
      system('bower list')

      dsl.delete_bower_json
    end

    def update?
      @options['update']
    end

    def command
      if update?
        'bower update'
      else
        'bower install'
      end
    end
  end
end
