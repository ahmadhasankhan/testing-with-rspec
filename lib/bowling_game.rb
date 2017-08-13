class BowlingGame
  attr_reader :first_in_frame

  def initialize
    @first_in_frame = 0
  end

  def pins(roles)
    @roles = roles
  end

  def score
    frame = 0
    score = 0

    while frame < 10
      if spare?
        score += 10 + bonus_for_spare
        @first_in_frame += 2
      elsif strike?
        score += 10 + bonus_for_strike
        @first_in_frame += 1
      else
        score += standard_frame_score
        @first_in_frame += 2
      end
      frame += 1
    end

    score
  end


  private

  def spare?
    @roles[first_in_frame] + @roles[first_in_frame + 1] == 10
  end

  def strike?
    @roles[first_in_frame] == 10
  end

  def bonus_for_spare
    @roles[first_in_frame + 2]
  end

  def bonus_for_strike
    @roles[first_in_frame + 1] + @roles[first_in_frame + 2]
  end

  def standard_frame_score
    @roles[first_in_frame] + @roles[first_in_frame+1]
  end
end