# -*- coding: utf-8 -*-
#require 'pry'
require './simple_deck'
require './logger'
require 'pp'

class HeartoCSim
  def initialize
    @deck = SimpleDeck.new
    @archive = []
  end

  def simulate(turn, trial_nums)
    trial_nums.times do |trial|
      @deck.reset
      @deck.shuffle
      @logger = Logger.new
      turn.times do |t|
        @deck.drawN(5)
        @logger.write_turn(t+1, @deck)
        player_action(t+1, @deck.get_hand_coin)
        @deck.hand_to_trash
      end
      @archive << @logger.dup
    end
    # pp @archive

  end

  def player_action(turn, coin)
    if coin >= 8
      #公爵
      @deck.add_trash(0)
      @logger.write_duke(turn)
    elsif coin >= 6
      #大都市
      @deck.add_trash(3)
    elsif coin >= 3
      #都市
      @deck.add_trash(2)
    end
  end

  def print_archive
    tmp = []
    @archive.each do |a|
      tmp << a.get_duke4
    end
    printf("%3f\n", tmp.inject(0.0){|r, i| r += i }/tmp.size)
  end

end

sim = HeartoCSim.new
sim.simulate(30,1000)
sim.print_archive
#binding.pry
