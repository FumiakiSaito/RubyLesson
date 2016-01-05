print "hello world!" # 改行なし
puts "hello world(puts)" # 改行あり
p "hello world(p)" # データ形式がわかるように表示

=begin
コメント
コメント
=end

# 変数
msg = "hello world"
p msg

# 定数(大文字)
ADMIN_EMAIL = "hoge@gmail.com"

# データ(全てオブジェクト)

# 文字列の長さ
p "hello wold".length




# 数値オブジェクト
x = 10 # 100_000_000
y = 20.5
# + - * / % **
# p x % 3 # 1
# p x ** 3 # 1000
# p z * 2 # 2/3
# x = x + 5
# x += 5 # 自己代入
# p x # 15
p y.round


# 文字列オブジェクト

name = "fumi"
x = "hello world, #{name}"
y = 'hello world, #{name}'
puts x 
puts y


puts "hello world" + " fumi"
puts "hello" * 5


# メソッド
# ! 破壊的メソッド
# ? 真偽値を返すメソッド

s = "fumi"
puts s.upcase
puts s

puts s.upcase!
puts s

p s.empty? # false
s = ""
p s.empty? # true


# 配列オブジェクト
sales = [5, 8, 4]
p sales[1]

# 0から2まで
p sales[0..2]

# 0から2未満
p sales[0...2]

# 最後の要素
p sales[-1]

# 1番目から2個分
p sales[1, 2]


sales[0...2] = [1, 2]
p sales
sales[1, 0] = [10, 11, 12]
p sales
sales[0,2] = []
p sales

# 要素数
p sales.size

# ソート
p sales.sort

# 末尾に追加
p sales.push(100)

# ハッシュオブジェクト
sales = {"fumi" => 200, "taro" => 300}
p sales["fumi"]

sales = {:fumi => 200, :taro => 300}
p sales[:fumi]

p sales.size
p sales.keys
p sales.values
p sales.has_key?(:fumi)




# オブジェクトの変換
a = 10
b = "5"
p a + b.to_i # 15
p a.to_s + b # "105"


h = {fumi: 100, taro: 200}
p h.to_a
 


s = "hell\"o"
s = %Q(hell"o)
p s

a = ["a", "b", "c"]
a = %W(a b c)

p a


score = 80
if score > 60
	puts "ok"
else
	puts "ng"
end


# case文
signal = "red"

case signal
when "red"
	puts "stop"
when "green", "blue"
	puts "go"
when "yellow"
	puts "caution"
else
	puts "wrong signal"
end

# 繰り返し処理
# times
# while

3.times do
	puts "hello"
end

3.times do |i|
        puts "#{i}: hello"
end

i = 0



while i < 3 do
	puts "#{i}: hello"
	i += 1
end

for i in 0..2 do
	puts i
end

for color in ["red", "blue", "pink"] do
	puts color
end


["red", "blue", "pink"].each do |color|
	puts color
end

{"red"=>200, "blue"=>100, "pink"=>50}.each do |color, price|
        puts "#{color}: #{price}"
end

# 関数的メソッド
def sayHi(name)
        s = "hello! " + name
	puts s
	return s
end

msg = sayHi("Tom")
puts msg


# アクセサ
     
class User
     
  def initialize(name)
    @name = name
  end
     
=begin
  # getter
  def name
    @name
  end
     
  # setter
  def setName(newName)
    @name = newName
  end
=end

  # getter,setterの自動生成     
  attr_accessor :name
  attr_reader :name # getter
  attr_writer :name # setter
     
  def sayHi
    puts "hello, my name is #{@name}"
      end  
    end
     
bob = User.new('Bob')
bob.sayHi()
p bob.name
# bob.setName('Tom')
bob.name = 'Tom'
bob.sayHi()


t = Time.now

p t.year
p t.month

t = Time.new(2016, 12, 05, 12, 32, 22)
p t.year
p t.month

p t.strftime("Updated: %Y-%m-%d")
