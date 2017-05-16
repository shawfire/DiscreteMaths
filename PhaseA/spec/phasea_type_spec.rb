require 'phasea_type'

# https://en.wikipedia.org/wiki/Contract_rummy
# https://en.wikipedia.org/wiki/Phase_10

describe 'PhaseAType' do

  before do
    #...
  end

  describe 'phasea_phase_type' do # context is an alias for describe

    it "returns the phase type 1" do
      expect(phasea_phase_type([['2S', '2S', '2H'], ['7H', '7S', '7D']])).to eq(1)
      expect(phasea_phase_type([['JS', 'JS', 'JH'], ['QH', 'QS', 'QD']])).to eq(1)
      expect(phasea_phase_type([['AS', 'JS', 'JH'], ['QH', 'QS', 'AD']])).to eq(1)
      expect(phasea_phase_type([['AS', 'JS', 'JH'], ['QH', 'AS', 'QD']])).to eq(1)
    end

    it "returns nil if invalid phase 1" do
      expect(phasea_phase_type([['2S', '3S', '2H'], ['7H', '7S', '7D']])).to eq(nil)
      expect(phasea_phase_type([['2S', '2S', '2H', '2D'], ['7H', '7S', '7D']])).to eq(nil)
    end

    it "returns the phase type 2" do
      expect(phasea_phase_type([['2C', '2C', '4C', 'KC', '9C', 'AH', 'JC']])).to eq(2)
      expect(phasea_phase_type([['2H', '2H', '4H', 'KH', '9H', 'AD', 'JH']])).to eq(2)

    end

    it "returns nil if invalid phase 2" do
      expect(phasea_phase_type([['2C', '2C', '4C', 'KC', '9C', 'AH', 'JH']])).to eq(nil)
    end


  end

end
