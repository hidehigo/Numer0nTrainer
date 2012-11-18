require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('123')
      end

      it "prompts for the first guess" do 
        output.should_receive(:puts).with('Enter guess:')
        game.start('123')
      end
    end

    describe "#guess" do
      it "sends the mark to output" do
        game.start('123')
        output.should_receive(:puts).with('3 eat 0 bite')
        game.guess('123')
      end
    end
  end
end

