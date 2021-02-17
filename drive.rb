require_relative "bst"

arr = (Array.new(15) { rand(1..100) })
bst = Tree.new(arr)

bst.pretty_print

puts bst.balanced?
puts bst.depth(86)
puts bst.depth(86)
puts bst.height(96)
puts "In-order:\t#{bst.inorder}"
puts "Pre-order:\t#{bst.preorder}"
puts "Post-order:\t#{bst.postorder}"
puts bst.level_order
p bst.find(48)
#puts bst.delete(50)

bst.rebalance



15.times do
    a = rand(100)
    bst.insert(a)
    puts "#{a} inserted succssfully into the tree"
end

bst.pretty_print

puts bst.balanced? ? "Yes balance" : "No not balance"

puts bst.height(80)

puts bst.depth(30)


puts "In-order:\t#{bst.inorder}"
puts "Pre-order:\t#{bst.preorder}"
puts "Post-order:\t#{bst.postorder}"
puts bst.level_order



        