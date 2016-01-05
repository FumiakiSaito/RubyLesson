# RubyLesson

###実行方法
```
$ ruby [ファイル名]
```

###コメント
```
# 1行コメント

=begin
複数行コメント
複数行コメント
=end
```

###変数定義
```
msg = "hello world"
```

###定数定義(全て大文字で定義する)
```
ADMIN_EMAIL = "hoge@gmail.com"
```

###データ
* 全てオブジェクトである

文字列はStringオブジェクトなのでメソッドが使える  

```
p "hello world".length
```

みたいな事ができる


数値オブジェクトも同様  

```
y = 20.5
p y.round
```

## 文字列オブジェクト
####ダブルクォートとシングルクォートの違い
```
name = "fumi"
x = "hello world, #{name}" # 変数が展開される。hello world, fumi
y = 'hello world, #{name}' # 変数が展開されない。hello world, #{name}
puts x
puts y
```

####文字列連結

```
puts "hello world" + " fumi" # hello world fumi
```

####文字列繰り返し

```
puts "hello " * 5 # hello hello hello hello hello
```

##メソッド
リファレンスを読むとメソッド名の後に!や?が付いているものがある  

* ! 破壊的メソッド
* ? 真偽値を返すメソッド


```
s = "fumi"
puts s.upcase # FUMI 呼ばれた時のみ大文字にする
puts s        # fumi

puts s.upcase! # FUMI
puts s         # FUMI 大文字に書き換わっている
```

```
p s.empty? # false
s = ""
p s.empty? # true
```

##配列オブジェクト
```
sales = [5, 8, 4]
p sales[1]
sales[1] = 10

# 0から2まで
p sales[0..2] # [5, 8, 4]

# 0から2未満
p sales[0...2] # [5, 8]

# 最後の要素
p sales[-1] # 4

# 1番目から2個分
p sales[1, 2] # [8, 4]

```

操作

```
# 0から2未満を書き換える
sales[0...2] = [1, 2]
p sales # [1, 2, 4]

# 1番目と2番目の間に挿入
sales[1, 0] = [10, 11, 12]
p sales # [1, 10, 11, 12, 2, 4]

# 0から2番目を削除
sales[0,2] = []
p sales # [11, 12, 2, 4]
```

メソッド

```
# 要素数
p sales.size

# 末尾に追加
p sales.push(100)
```

##ハッシュオブジェクト

```
sales = {"fumi" => 200, "taro" => 300}
p sales["fumi"] # 200

# シンボルを使った書き方
sales = {:fumi => 200, :taro => 300}
p sales[:fumi] # 200

p sales.size            # 2
p sales.keys            # [:fumi, :taro]
p sales.values          # [200, 300]
p sales.has_key?(:fumi) # true
```

##オブジェクトの変換
```
a = 10
b = "5"
p a + b.to_i # 15 数値に変換し演算
p a.to_s + b # "105" 文字列に変換し文字列連結

# ハッシュから配列に変換
h = {fumi: 100, taro: 200}
p h.to_a # [[:fumi, 100], [:taro, 200]]

```


## %記法(文字列や配列の別の記法)

文字列  

```
# 通常の書き方
s = "hell\"o"

# %記法
s = %Q(hell"o)
p s # "hell\"o"
```


配列

```
# 通常の書き方
a = ["a", "b", "c"]

# %記法
a = %W(a b c)
p a # ["a", "b", "c"]
```



## 条件分岐

```
score = 80
if score > 60
        puts "ok"
else
        puts "ng"
end
```

```
true: それ以外(0 '' を含む)
false: false nil(オブジェクトが存在しない)

if x
    puts "..."
end
```

## case文

```
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
```

##繰り返し処理

times

```
# 数値オブジェクトのtimesメソッドを使う
3.times do
        puts "hello"
end

# timesメソッドを使うかつループカウンタを使う
3.times do |i|
        puts "#{i}: hello"
end
```

while

```
# while文を使う
i = 0
while i < 3 do
        puts "#{i}: hello"
        i += 1
end
```

for

```
for i in 0..2 do
        puts i
end

for color in ["red", "blue", "pink"] do
        puts color
end
```

each

```
["red", "blue", "pink"].each do |color|
        puts color
end

{"red"=>200, "blue"=>100, "pink"=>50}.each do |color, price|
        puts "#{color}: #{price}"
end
```

##関数的メソッド

```
def sayHi(name)
        s = "hello! " + name
        puts s
        return s
end

msg = sayHi("Tom") # hello! Tom
puts msg           # hello! Tom
```

## クラス

```
# クラス
class User
        # クラス変数
        @@count = 0

        # コンストラクタ
        def initialize(name)
                # インスタンス変数に代入
                @name = name
                @@count += 1
        end

        # インスタンスメソッド
        def sayHi
                puts "hello " + @name
        end
                puts "hello " + @name
        end

        # クラスメソッド
        def User.sayHello
                puts "hello from User class #{@@count}"
        end
end

# クラスメソッド実行
User.sayHello()  # hello from User class 0

# インスタンス作成
tom = User.new("tom")

# インスタンスメソッド実行
tom.sayHi()

# クラスメソッド実行
User.sayHello() # hello from User class 1
```

##クラスの継承

```
# Userクラス
class User
 
  def initialize(name)
    @name = name
  end
 
  def sayHi
    puts "hello, my name is #{@name}"
  end
 
end

# Userを継承したクラス
class SuperUser < User
 
  def shout
    puts "HELLO! from #{@name}!"
  end
 
end

tom = User.new("Tom")
bob = SuperUser.new("Bob")
tom.sayHi() # hello, my name is Tom
bob.sayHi() # hello, my name is Bob
bob.shout() # HELLO! from Bob
tom.shout() # エラー
```

##アクセサ

```
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

  # setter
  def setName(newName)
    @name = newName
  end
=end

  # getter,setterの自動生成
  attr_accessor :name
  attr_reader :name # getterのみ
  attr_writer :name # setterのみ

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
```

##組み込みクラス例(TIME)

```
t = Time.now

p t.year
p t.month

t = Time.new(2016, 12, 05, 12, 32, 22)
p t.year
p t.month
p t.strftime("Updated: %Y-%m-%d") # "Updated: 2016-12-05"
```




