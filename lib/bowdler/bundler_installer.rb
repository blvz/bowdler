require 'bowdler/rake'

module Bowdler
  module BundlerInstaller
    def self.included(base)
      base.class_eval do
        alias :old_run :run

        def run(options)
          result = old_run(options)
          Bowdler::Rake.new(options).perform
          result
        end
      end
    end
  end
end

