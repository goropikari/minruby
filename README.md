[RubyでつくるRuby ゼロから学びなおすプログラミング言語入門](https://www.lambdanote.com/products/ruby-ruby)
```

$ docker build -t minruby .
$ docker run --rm -it -v $(pwd):/minruby minruby bash
$ cd /minruby
root@640fb845839f:/minruby# ruby interp.rb ch9/test.rb
```
