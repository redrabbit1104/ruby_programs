require './art_guess_number'
require './set_difficulty'
require './check_answer'

def game()
  puts LOGO
  puts "私が考えている数字は何でしょう？"
  answer = rand(1..100)             #答えをランダムで生成する
  turns = set_difficulty()          #難易度によるターンの設定
  guess = 0
  
  loop do
    puts "チャンスはあと#{turns}回です。"
    puts "数字を当ててみてください。範囲は1〜100の間です。"
    guess = gets.to_i                          #ユーザーが入力した数字
    turns = check_answer(guess, answer, turns)     #
    if turns == 0
      puts "残念です。あなたの負けです。"
      break
    elsif guess != answer
      puts "違いますね。もう一度チャンスをあげます。"
    else
      break
    end
  end
end

game()