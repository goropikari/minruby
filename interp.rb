require 'minruby'

env = {}
env["plus_count"] = 0
def evaluate(tree, env)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    env["plus_count"] += 1
    evaluate(tree[1], env) + evaluate(tree[2], env)
  when "-"
    evaluate(tree[1], env) - evaluate(tree[2], env)
  when "*"
    evaluate(tree[1], env) * evaluate(tree[2], env)
  when "/"
    evaluate(tree[1], env) / evaluate(tree[2], env)
  when "%"
    evaluate(tree[1], env) % evaluate(tree[2], env)
  when "**"
    evaluate(tree[1], env) ** evaluate(tree[2], env)
  when "=="
    evaluate(tree[1], env) == evaluate(tree[2], env)
  when ">"
    evaluate(tree[1], env) > evaluate(tree[2], env)
  when "<"
    evaluate(tree[1], env) < evaluate(tree[2], env)
  when "func_call"
    p(evaluate(tree[2], env))
  when "stmts"
    i = 1
    while tree[i] != nil
      last = evaluate(tree[i], env)
      i = i + 1
    end
    last
  when "var_assign"
    env[tree[1]] =  evaluate(tree[2], env)
  when "var_ref"
    env[tree[1]]
  when "if"
    if (evaluate(tree[1], env))
      evaluate(tree[2], env)
    else
      evaluate(tree[3], env)
    end
  when "while"
    while evaluate(tree[1], env)
      evaluate(tree[2], env)
    end
  when "while2"
    evaluate(tree[2], env)
    while evaluate(tree[1], env)
      evaluate(tree[2], env)
    end
  else
    p("No method matching")
  end
end

def max(tree)
  case tree[0]
  when "lit"
    tree[1]
  else
    left = max(tree[1])
    right = max(tree[2])
    if left < right
      right
    else
      left
    end
  end
end

str = minruby_load()
tree = minruby_parse(str)
evaluate(tree, env)
