EASY_LEVEL = 10
HARD_LEVEL = 5

def set_difficulty()
  loop do
    puts "難易度を選んでください。easyかhardかどちらかを入力してください"
    level = gets.chomp
    if level == "easy"
      return EASY_LEVEL
    elsif level == "hard"
      return HARD_LEVEL
    else
      puts "入力が間違っています"
    end
  end
end