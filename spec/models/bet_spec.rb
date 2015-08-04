require 'spec_helper'

RSpec.describe "Bet" do
  
  context "proper bet metrics" do
    describe '#get_appropriate_metric' do
      it "returns the correct metrics" do
        expect(Bet.get_appropriate_metric("QB")).to eq(Bet::QB_BET_METRICS)
        expect(Bet.get_appropriate_metric('TE')).to eq(Bet::WR_TE_BET_METRICS)
        expect(Bet.get_appropriate_metric('WR')).to eq(Bet::WR_TE_BET_METRICS)
        expect(Bet.get_appropriate_metric('RB')).to eq(Bet::RB_BET_METRICS)
      end
    end
  end


end