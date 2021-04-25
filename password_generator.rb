#アルファベット（大、小）と数字（0~9)、記号を配列で用意する
LETTERS = ("a".."z").to_a + ("A".."Z").to_a
NUMBERS = ("0".."9").to_a
SYMBOLS = ['!', '#', '$', '%', '&', '(', ')', '*', '+', '~', '¥', '[', ']', '?', '<', '>', '/', '@']

#暗号を生成する関数を定義
def cipher(number_of_letters, number_of_numbers, number_of_symbols)
  output = ""    #出力結果を保存する入れ物を用意
  number_of_letters.times do       #入力された文字の数だけ、LETTERSから取り出してくっ付ける
    random_letter = LETTERS[rand(LETTERS.length)]
    output << random_letter
  end
  number_of_numbers.times do        #入力された数字の数だけ、NUMBERSから取り出してくっ付ける
    random_number = NUMBERS[rand(NUMBERS.length)]
    output << random_number
  end
  number_of_symbols.times do       #入力された記号の数だけ、SYMBOLSから取り出してくっ付ける
    random_symbol = SYMBOLS[rand(SYMBOLS.length)]
    output << random_symbol
  end

  #くっ付けた暗号文は文字列、数字、記号順になっているため、それをランダムに混ぜる処理
  array_output = []    #ランダムにした結果の入れ物を用意
  array_output = output.chars    #String型になっているoutputを配列に変換

  array_of_cipher_text = array_output.shuffle        #array_outputを混ぜる（並び順をランダムにする）
  cipher_text = array_of_cipher_text.join         #配列のarray_of_cipher_textをsrtingにする
  return cipher_text             #完成物（cipher_text)をreturn
end

#メインの処理
loop do
  #それぞれ文字数、記号の数、数字の数を入力してもらう
  puts "パスワードに使うアルファベットの文字数を教えてください。"
  input_number_of_letters = gets.to_i
  puts "記号の数を教えてください。"
  input_number_of_symbols = gets.to_i
  puts "数字の数を教えてください。"
  input_number_of_numbers = gets.to_i

  #結果の出力
  returned_cipher_text = cipher(input_number_of_letters, input_number_of_symbols, input_number_of_numbers)  #cipher関数の実行
  puts "生成された暗号文は「#{returned_cipher_text}」です。"

  #もう一度やり直すかプログラムを抜けるかを選択してもらう
  puts "もう一度やりますか？「はい」か「いいえ」を入力してください。"
  restart = gets.chomp
  if restart == "いいえ"            #いいえを入力した場合はさようならが出力され、プログラムを終了
    puts "さようなら"
    break
  end
end
