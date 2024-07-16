require_relative './fizz_buzz'

# 正しい型を引数に設定するとsteep checkしてもNo type error detectedでエラーが出力されない
# results = FizzBuzz.run(15)

# 下記だとint型を引数に設定していないのでCannot pass a value of type `::String` as an argument of type `::Integer`のエラーが出力される
results = FizzBuzz.run('abc')
puts results