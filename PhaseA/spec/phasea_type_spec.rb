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
      expect(phasea_phase_type([['2H', '2H', '4H', 'KH', '9H', 'KH', 'JH']])).to eq(2)
    end

    it "returns nil if invalid phase 2" do
      expect(phasea_phase_type([['2C', '2C', '4C', 'KC', '9C', 'AH', 'JH']])).to eq(nil)
    end

    it "returns the phase type 3" do
      expect(phasea_phase_type([['2S', '2S', '2H', '2D'], ['7H', '7S', '7D', '7D']])).to eq(3)
      expect(phasea_phase_type([['AS', '4S', '4H', '4D'], ['AH', '7S', 'AD', '7D']])).to eq(3)
    end

    it "returns nil if invalid phase 3" do
      expect(phasea_phase_type([['2S', '2S', '3H', '2D'], ['7H', '7S', '7D', '7D']])).to eq(nil)
      expect(phasea_phase_type([['2S', '2S', '3H', '2D'], ['7H', '7S', '8D', '7D']])).to eq(nil)
    end

    it "returns the phase type 4" do
      expect(phasea_phase_type([['4H', '5S', 'AC', '7C', '8H', 'AH', '0S', 'JC']])).to eq(4)
      expect(phasea_phase_type([['AH', '5S', 'AC', '7C', '8H', 'AH', '0S', 'JC']])).to eq(4)
    end

    it "returns nil if invalid phase 4" do
      expect(phasea_phase_type([['AH', '5S', 'AC', '7C', '8H', 'AH', '0S', 'QC']])).to eq(nil)
    end

    it "returns the phase type 5" do
      expect(phasea_phase_type([['2S', '3C', '4C', '5S'], ['7C', '7S', '7D', '7D']])).to eq(5)
      expect(phasea_phase_type([['2S', '3C', '4C', '5S'], ['7C', '7S', '7D', '7D']])).to eq(5)
    end

    it "returns nil if invalid phase 5" do
      expect(phasea_phase_type([['2S', '2C', '4C', '5S'], ['7C', '7S', '7D', '7D']])).to eq(nil)
    end


  end

end
