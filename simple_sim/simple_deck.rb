# -*- coding: utf-8 -*-
class SimpleDeck
  def initialize
    @stock = []
    @trash = []
    @hand  = []
  end

  #初期手札生成
  def configure
    7.times do
      @stock << 1
    end
    3.times do
      @stock << 0
    end
  end

  def reset
    @stock.clear
    @trash.clear
    @hand.clear
    configure
  end


  #カードを1枚デッキに追加する
  def add(coin_power)
    @stock << coin_power
  end

  #カードを1枚捨て札に追加する(購入した、獲得した)
  def add_trash(coin_power)
    @trash << coin_power
  end

  #カードを1枚ドローする
  def draw
    card = @stock.pop
    unless card.nil?
      @hand.push(card)
    else
      # 山札がなくなったが捨て札がある
      unless @trash.empty?
        merge_deck(@stock, @trash)
        shuffle
        draw
      end
    end
  end

  #カードをn枚ドローする
  def drawN(n)
    n.times do
      draw
    end
  end

  #カードの束、bをaに移す
  def merge_deck(a, b)
    a.concat(b)
    b.clear
    return a
  end

  #カードを1枚捨てる
  def slough
  end

  # 手札をすべて捨て札にする。
  def hand_to_trash
    @trash.concat(@hand)
    @hand.clear
  end

  #山札をシャッフルする
  def shuffle
    @stock.shuffle!
  end

  def all_cards
    tmp = []
    tmp += @hand
    tmp += @stock
    tmp += @trash
    tmp
  end

  def get_size
    tmp = all_cards
    tmp.size
  end

  # 平均コイン力を出力する
  def get_coin_avg
    tmp = all_cards
    tmp.inject(0.0){ |sum, c| sum + c }/tmp.size
  end

  # 手札のcoin力を出す
  def get_hand_coin
    @hand.inject{ |sum, c| sum + c}
  end

  def get_breakdown
    cards = all_cards
    farm = cards.select{|n| n == 1}.size
    city = cards.select{|n| n == 2}.size
    metro = cards.select{|n| n == 3}.size
    ascend = cards.select{|n| n == 0}.size
    return farm, city, metro, ascend
  end


end
