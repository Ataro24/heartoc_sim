class Logger
  def initialize
    @turn_record = []
    @duke = {}
    reset
  end

  def reset
    @turn_record.clear
    @duke[:num]  = 0
    @duke[:num4] = 0
    @duke[:num5] = 0
  end

  def write_turn(t, deck)
    @turn_record << {
      :turn  => t,
      :avg   => deck.get_coin_avg,
      :hands => deck.get_hand_coin,
      :size  => deck.get_size
    }
  end

  def write_duke(t)
    @duke[:num] += 1
    case @duke[:num]
    when 4
      @duke[:num4] = t
    when 5
      @duke[:num5] = t
    end
  end

  def print
    # puts "duke: #{duke}, duke4: #{duke4}, duke5: #{duke5}"
    # f, c, m, a = deck.get_breakdown
    # puts "farm: #{f} city: #{c} metro: #{m} ascend: #{a}"
  end

  def get_duke4
    @duke[:num4]
  end




end
