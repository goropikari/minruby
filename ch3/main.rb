node1 = [" 節 1", [" 節 2", [" 葉 A"], [" 葉 B"]], [" 節 3", [" 葉 C"], [" 葉 D"]]]

def preorder(tree)
  if tree[0].start_with?(" 葉")
    p(tree[0])
    return
  end
  preorder(tree[1])
  preorder(tree[2])
end

def postorder(tree)
  if tree[0].start_with?(" 葉")
    p(tree[0])
    return
  end
  postorder(tree[1])
  postorder(tree[2])
  p(tree[0])
end
