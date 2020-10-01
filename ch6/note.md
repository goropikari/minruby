6.6.3

```
$ ruby interp.rb ch6/test.rb
42
42
"others"

$ ruby ch6/test.rb
42
"others"
```

MinRuby のほうが 42 が出力される回数が1回多い。与えられたプログラムに `minruby_parse` をすると `p(42)` の評価が複数回行われていることがわかる。
これにより、Ruby とは違う結果になる。

```
require "minruby"
pp(minruby_parse('
case p(42)
when 0
  p(0)
when 1
  p(1)
else
  p("others")
end
'))

#=> ["if",
#=>  ["==", ["func_call", "p", ["lit", 42]], ["lit", 0]],
#=>  ["func_call", "p", ["lit", 0]],
#=>  ["if",
#=>   ["==", ["func_call", "p", ["lit", 42]], ["lit", 1]],
#=>   ["func_call", "p", ["lit", 1]],
#=>   ["func_call", "p", ["lit", "others"]]]]
```
