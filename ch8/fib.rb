def fib(x)
  if x < 2
    x
  else
    fib(x - 1) + fib(x - 2)
  end
end

p(fib(10))

