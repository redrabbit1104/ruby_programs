def check_answer(guess, answer, turns)
  if guess > answer
    puts "#{guess}より低い数字です"
    return turns -1
  elsif guess < answer
    puts "#{guess}より高い数字です"
    return turns -1
  else
    puts "さすがです。答えは#{answer}でした"
  end
end