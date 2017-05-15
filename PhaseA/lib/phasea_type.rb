
# Phase 1
# A set of three cards of the same value, e.g. ['2C', '2S', '2H']
# represents a set of three Twos.
# Note that the set may include Wilds, but must include at least two
# "natural" cards (i.e. non-Wild cards),
# which define the value. Note also that the sequence of the cards is
# not significant for this group type.
#
# >> group = ['2S', '2S', '2H']
# => ["2S", "2S", "2H"]
# >> for card in group do
# ?>   puts card
# >> end
# 2S
# 2S
# 2H
# >> wilds = ['AH', 'AD', 'AC', 'AS']
# => ["AH", "AD", "AC", "AS"]
# >> card = 'AC'
# => "AC"
# >> wilds.include?(card)
# => true
# >> card
# => "AC"
# >> card[0]
# => "A"
# e.g. ["2S", "2S", "2H"]
def phasea_phase_one(group)
  wilds = ['AH', 'AD', 'AC', 'AS']
  wild_count = 0
  card_num_count = 0
  card_num = nil
  for card in group do
      if wilds.include?(card)
          wild_count += 1
      elsif card_num.nil?
          card_num = card[0]
          card_num_count += 1
      elsif card[0] == card_num
          card_num_count += 1
      end
  end

  if wild_count <= 1 and (card_num_count + wild_count) == 3 and group.count == 3
      return 1
  else
      return nil
  end
end


def phasea_phase_type(group)

  phase_type = nil

  # Phase 1 check eg. [['2S', '2S', '2H'], ['7H', '7S', '7D']]
  if group.count == 2 and
    phasea_phase_one(group[0]) == 1 and
    phasea_phase_one(group[1]) == 1

    phase_type = 1
  end

  # Phase 2 check e.g.[['2C', '7C', '7C', '8C', 'JC', 'QC', 'KC']]
  #TODO implement for phase 2 in like manner

  return phase_type
end

puts(phasea_phase_type([['2S', '2S', '2H'], ['7H', '7S', '7D']]))
#Should return 1
