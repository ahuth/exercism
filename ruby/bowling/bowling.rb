class Game
  def initialize
    @frames = []
  end

  def roll(pins)
    if unfinished_frame?
      @frames.last << pins
    else
      if @frames.last && @frames.last.spare?
        @frames.last << pins
      end
      @frames << Frame.new(pins)
    end
  end

  def score
    @frames.reduce(0) { |acc, frame| acc + frame.total }
  end

  private

  def unfinished_frame?
    @frames.any? && !@frames.last.finished?
  end
end

class Frame
  def initialize(pins)
    @shots = [pins]
  end

  def <<(pins)
    @shots << pins
  end

  def total
    @shots.reduce(0, &:+)
  end

  def finished?
    total == 10 || @shots.length >= 2
  end

  def strike?
    total == 10 && @shots.length == 1
  end

  def spare?
    total == 10 && @shots.length == 2
  end
end
