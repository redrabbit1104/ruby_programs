#アルファベットを配列で用意しグローバル変数alphabetに格納。シフトナンバーが26文字を超える場合も想定し、a~zの文字列を2回。合計52文字を格納
$alphabet =  ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

#暗号or復号を行う関数を作成
def cipher(start_text, shift, cipher_direction)
  end_text = ""     #完成した文字列を格納する変数を初期化
  if cipher_direction == "復号"    #復号だった場合の処理
    shift *= -1
  end
  split_start_text = start_text.split("")  #入力したテキストを配列にする
  split_start_text.each do |char|   #配列から１文字ずつ取り出しcharという変数で処理
    if $alphabet.include?(char)    #スペースなどの空文字がない場合の処理
      position = $alphabet.index(char)    #index関数を使い、文字のcharが$alphabetのどの添字（index）=位置なのかを探し、変数positionに格納
      new_position = position + shift     #charの位置から右にシフトさせる数(shift数)を足して、新しい位置を求める
      end_text += $alphabet[new_position]   #上記で求めた新しいindexを$alphabet配列の添字として代入。最終的に出来上がる文字列をend_textにして、その変数に足していく
    else         #スペースなどの空文字が入っている場合の処理
      end_text += char   #$alphabetの中に存在しない、空文字もend_textに足す
    end
  end
  puts "#{cipher_direction}文は「#{end_text}」です。"   #結果を出力する
end

#いいえを入力するまで、繰り返し処理を行う
loop do
  puts "「復号」かもしくは「暗号」を入力してください。"   
  direction = gets.chomp
  puts "文字列を入力してください。"
  input_text = gets.chomp
  text = input_text.downcase
  puts "シフト数を入力してください。"
  input_shift = gets.to_i

  shift = input_shift % 26   #シフト数が26文字を超えた場合には26で割った数の余りでシフト数を求める

  cipher(text, shift, direction)  #cipher関数の実行

  puts "もう一度やりますか？「はい」か「いいえ」を入力してください。"
  restart = gets.chomp
  if restart == "いいえ"            #いいえを入力した場合はさようならが出力され、プログラムを終了
    puts "さようなら"
    break
  end
end
