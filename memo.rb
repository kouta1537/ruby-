require "csv"

puts "1(ファイルを新規で作成する)・2(既存ファイルを編集する)"
memo_type = gets.to_s
puts "入力：" + memo_type
input_number = memo_type.chomp  
 

if input_number == "1"
   puts "新規でメモを作成します。作りたいファイル名を入力（拡張子を除く）"
   file_name = gets.chomp

   puts "メモの内容を記入してください。ctrl+Dで保存します"
   input_memo = STDIN.read
   memo = input_memo.chomp

CSV.open("#{file_name}.csv","w") do |csv|
csv.puts ["#{memo}"]
end

elsif input_number == "2"
    puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力"
    file_name = gets.chomp

    puts "編集する内容を記入してください。完了後、ctrl+Dで保存します"
    additional_memo = STDIN.read.chomp
CSV.open("#{file_name}.csv","a") do |csv|
    csv.puts ["#{additional_memo}"]
end

else
    puts "1か2を入力してください"
end
    
