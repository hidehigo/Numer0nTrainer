require 'spec_helper'

module Codebreaker
  describe Marker do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }

    describe "#exact_match_count" do
      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('123', '567')
          marker.exact_match_count.should == 0
        end
      end
      context "with 1 exact match" do
        it "returns 1" do
          marker = Marker.new('123', '156')
          marker.exact_match_count.should == 1
        end
      end
      context "with 1 number match" do
        it "returns 0" do
          marker = Marker.new('123', '256')
          marker.exact_match_count.should == 0
        end
      end
      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('123', '152')
          marker.exact_match_count.should == 1
        end
      end
    end

    describe "#number_match_count" do
      context "with no matches" do
        it "returns 0" do
          marker = Marker.new('123', '567')
          marker.number_match_count.should == 0
        end
      end
      context "with 1 number match" do
        it "returns 1" do
          marker = Marker.new('123', '255')
          marker.number_match_count.should == 1
        end
      end
      context "with 1 exact match" do
        it "returns 0" do
          marker = Marker.new('123', '157')
          marker.number_match_count.should == 0
        end
      end
      context "with 1 exact match and 1 number match" do
        it "returns 1" do
          marker = Marker.new('123', '152')
          marker.exact_match_count.should == 1
        end
      end
    end

    describe "#number_match_count" do
      context "with 1 exact match duplicated in guess" do
        it "returns 0" do
          marker = Marker.new('123', '115')
          marker.number_match_count.should == 0
        end
      end
    end
  end
end

