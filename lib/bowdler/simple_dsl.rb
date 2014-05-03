require 'json'

module Bowdler
  class SimpleDsl
    
    def self.evalute(filename)
      new.tap { |dsl| dsl.eval_file(File.join(dsl.root_path, filename)) }
    end

    attr_reader :bower_directory, :root_path

    def initialize
      @root_path = Dir.pwd
      @assets = {}
      @bower_directory = 'vendor'
    end

    def eval_file(file)
      instance_eval(File.open(file, 'rb') { |f| f.read }, file.to_s)
    end

    def asset(name, version = 'latest')
      @assets[name] = version
    end

    def assets_path(path)
      @bower_directory = path
    end

    def generate_dotbowerrc
      contents = JSON.parse(File.read(File.join(@root_path, '.bowerrc'))) rescue {}
      contents['directory'] = @bower_directory
      JSON.pretty_generate(contents)
    end

    def write_dotbowerrc
      open(File.join(@root_path, '.bowerrc'), 'w') {|f| f.write(generate_dotbowerrc)}
    end

    def write_bower_json
      open(File.join(@root_path, 'bower.json'), 'w') {|f| f.write(dependencies_to_json(@assets))}
    end

    def delete_bower_json
      File.delete(File.join(@root_path, 'bower.json'))
    end

    def dependencies_to_json(data)
      JSON.pretty_generate({
        :name => 'bundler-bower generated',
        :dependencies => data
      })
    end

    def method_missing(*)
    end
  end
end
