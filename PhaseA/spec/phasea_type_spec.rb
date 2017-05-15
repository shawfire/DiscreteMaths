require 'phasea_type'

# https://en.wikipedia.org/wiki/Phase_10

describe 'PhaseAType' do

  before do
    #...
  end

  describe 'phasea_phase_type' do # context is an alias for describe

    it "returns the phase type" do
      expect(phasea_phase_type([['2S', '3S', '2H'], ['7H', '7S', '7D']])).to eq(nil)
    end

    it "returns nil if invalid phase" do
      expect(phasea_phase_type([['2S', '3S', '2H'], ['7H', '7S', '7D']])).to eq(nil)
    end

  end

end
