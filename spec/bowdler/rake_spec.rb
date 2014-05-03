require 'spec_helper'

module Bowdler
  describe Rake do
    let(:options) { {} }
    subject { Rake.new(options) }

    describe 'recognize dependency file' do
      before { stub(Dir).entries(any_args) { files } }

      context 'Bowerfile and Gemfile' do
        let(:files) { ['Gemfile', 'Bowerfile', 'other-file' ].shuffle }

        it 'returns Bowerfile' do
          subject.dependency_file.should == 'Bowerfile'
        end
      end
    end

    describe 'during bundle (install)' do
      describe '#update?' do
        it 'returns false' do
          subject.update?.should be_false
        end
      end

      describe '#command' do
        it "returns 'bower install'" do
          subject.command.should == 'bower install'
        end
      end
    end

    describe 'during bundle update' do
      let(:options) { {'update' => true} }

      describe '#update?' do
        it 'returns true' do
          subject.update?.should be_true
        end
      end

      describe '#command' do
        it "returns 'bower install'" do
          subject.command.should == 'bower update'
        end
      end
    end
  end
end
