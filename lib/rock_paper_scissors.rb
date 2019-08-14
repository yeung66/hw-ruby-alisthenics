class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  @@STRATEGY = {'R'=>'S','P'=>'R','S'=>'P'}

  def self.winner(player1, player2)
    
    # puts player1.inspect
    # puts player2.inspect
    # YOUR CODE HERE
    if @@STRATEGY.key?(player1[1]) && @@STRATEGY.key?(player2[1])
      if @@STRATEGY[player1[1]] == player2[1]
        return player1
      elsif player1[1]==player2[1]
        return player1
      else
        return player2
      end
    else
      raise NoSuchStrategyError
    end
  end

  def self.tournament_winner(tournament)
    # YOUR CODE HERE
    # p1 = tournament[0].size == 1 ? tournament[0] : self.tournament_winner(tournament[0])
    # p2 = tournament[1].size == 1 ? tournament[1] : self.tournament_winner(tournament[1])
    if tournament[0][0].class == String
      return self.winner(tournament[0],tournament[1])
    else
      self.winner(self.tournament_winner(tournament[0]),tournament_winner(tournament[1]))
    end
  end

end


puts RockPaperScissors.tournament_winner([
  [
    [ ["Armando", "P"], ["Dave", "S"] ],      
    [ ["Richard", "R"], ["Michael", "S"] ]
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]).inspect