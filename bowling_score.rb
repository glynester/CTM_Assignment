def bowling_score(score)
  general_validation(score)
  score.gsub("-","0")
  scores = score.split("||")
  std_frames = scores[0].split("|").map{|f| [f.split(//)].flatten(1) }
  bonus_frames = ( scores.length==1 ? [0,0] : scores[1].split("") )
  bonus_validation(std_frames,bonus_frames)
  std_frames = create_scores_array(std_frames,"s")
  bonus_frames = create_scores_array(bonus_frames,"b") if bonus_frames != [0,0]
  calc_game_score(std_frames, bonus_frames)
end

def create_scores_array(scores, arr_type)
  if arr_type == "s"
    return scores.map{|f|
      f.length == 1 ? reg_ball_score(f[0]) : reg_ball_score(f[0], f[1])
    }
  elsif arr_type == "b"
    return (scores.length == 1 ? bonus_ball_score(scores[0]) : bonus_ball_score(scores[0], scores[1]))
  end
end

def bonus_ball_score(ball1,ball2=0)
  if ball1 == "X" && ball2 == "X"
    return [10,10]
  elsif ball1 == "X"
    return [10,ball2.to_i]
  elsif ball2 == "X"
    return [ball1.to_i,10]
  else
    return [ball1.to_i,ball2.to_i]
  end
end

def reg_ball_score(ball1,ball2=0)
  if ball1 == "X"
    return [10]
  elsif ball2 == "/"
    return [ball1.to_i, 10-ball1.to_i]
  else
    return [ball1.to_i, ball2.to_i]
  end
end

def calc_game_score(std_frames, bonus_frames)
  score = 0
  all_frames = std_frames.clone.push(bonus_frames)
  std_frames.each_with_index{|v,i|
    if v.length == 1
      score += 10 + all_frames[i+1..-1].flatten[0..1].reduce(:+)
    elsif v.reduce(:+) == 10
      score += 10 + all_frames[i+1][0]
    else
      score += v.reduce(:+)
    end
  }
  score
end

def general_validation(score)
  frames = /[1-9]{2}\||X\||--\||[1-9]\/\||[1-9]-\||-[1-9]\|/
  bonus = /\|\|[1-9]{2}|\|\|XX|\|\|X-|\|\|X[1-9]|\|\|[1-9]-|\|\|--|\|\|-[1-9]|\|\|[1-9]X|\|\|-X|\|\|-|\|\|[1-9]|\|\|X|\|\|/
  bonus = /#{bonus}\z/
  frames = /\A#{frames}{10}\|/
  if !frames.match(score)
    raise ("Invalid regular frame(s) + #{score}")
  elsif !bonus.match(score)
    raise ("Invalid bonus frame + #{score}")
  end
end

def bonus_validation(std_frames, bonus_frames)
  if std_frames[9].length == 1 && bonus_frames.length != 2
    raise ("Invalid number of throws in bonus frame: #{bonus_frames}")
  end
  if std_frames[9].length == 2 && std_frames[9][1] == "/" && bonus_frames.length != 1
    raise ("Invalid number of throws in bonus frame: #{bonus_frames}")
  end
end

# Test regex
print bowling_score("52|52|52|-2|5/|5-|52|X|--|X||X-"); puts
#Normal tests
print bowling_score("X|X|X|X|X|X|X|X|X|X||XX"); puts # 300
print bowling_score("9-|9-|9-|9-|9-|9-|9-|9-|9-|9-||"); puts # 90
print bowling_score("5/|5/|5/|5/|5/|5/|5/|5/|5/|5/||5"); puts # 150
print bowling_score("8/|8/|8/|8/|8/|8/|8/|8/|8/|8/||8"); puts # 180
print bowling_score("X|7/|9-|X|-8|8/|-6|X|X|X||81"); puts # 167
print bowling_score("54|2/|X|14|X|X|X|3/|25|X||X8"); puts # 169
print bowling_score("54|2/|X|14|X|X|X|3/|25|9/||X"); puts # 161
print bowling_score("--|--|--|--|--|--|--|--|--|X||X8"); puts # 28
# ERROR SCENARIOS:
# print bowling_score("--|--|--|--|--|--|--|--|--|X||8"); puts # error
# print bowling_score("8/|8/|8/|8/|8/|8/|8/|8/|8/|8/||8X"); puts # error
