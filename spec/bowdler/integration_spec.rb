require 'spec_helper'

describe 'Integration test' do
  let(:test_node) { TestNode.new(:gemfile => "#{directory}/Gemfile", :type => 'install') }

  before { Dir.chdir(directory) { test_node.spawn } }
  after  { FileUtils.rm_rf("#{directory}/vendor") }

  describe 'Bowerfile' do
    let(:directory) { File.join(File.dirname(__FILE__), '../bowerfile') }

    it 'download backbone' do
      File.exist?("#{directory}/vendor/backbone/backbone.js").should be_true
    end
  end

  describe 'Bowerfile with custom install path' do
    let(:directory) { File.join(File.dirname(__FILE__), '../bowerfile_assets_path') }

    it 'download backbone' do
      File.exist?("#{directory}/vendor/assets/backbone/backbone.js").should be_true
    end
  end
end
