class RockPaperScissors
  WIN_CONDITION = 5
  CHOICES = [:rock, :paper, :scissors]
  COMBINATION_MAP = {
    :rock => { :rock => :draw, :paper => :loss, :scissors => :win },
    :paper => { :rock => :win, :paper => :draw, :scissors => :loss },
    :scissors => { :rock => :loss, :paper => :win, :scissors => :draw }
  }

  attr_reader :round

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @round = 0
  end

  def self.new_game(player1, player2)
    @game = RockPaperScissors.new(player1, player2)
  end

  def self.instance
    @game
  end

  def play_round(p1_choice, p2_choice)
    @round += 1
    result = COMBINATION_MAP[p1_choice][p2_choice]
    update_score(result)
    result
  end

  def winner
    return_value = nil
    return_value = @player1 if @player1.score >= WIN_CONDITION
    return_value = @player2 if @player2.score >= WIN_CONDITION

    return_value
  end

  private

  def update_score(result)
    return if result == :draw

    result == :win ? @player1.score += 1 : @player2.score += 1
  end
end
