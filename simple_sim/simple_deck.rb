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

  # 平均コイン力を出力する
  def get_coin_avg
    @stock.inject(0.0){|r,i| r+=i }/@stock.size
  end

end
