class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinaryTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
    else
      insert_rec(@root, value)
    end
  end

  def display
    display_rec(@root)
  end

  def sum_values
    sum_values_rec(@root)
  end

  def tree_max
    tree_max_rec(@root)
  end

  private

  def insert_rec(node, value)
    if value < node.value
      if node.left.nil?
        node.left = Node.new(value)
      else
        insert_rec(node.left, value)
      end
    else
      if node.right.nil?
        node.right = Node.new(value)
      else
        insert_rec(node.right, value)
      end
    end
  end

  def display_rec(node)
    return if node.nil?

    display_rec(node.left)
    puts node.value
    display_rec(node.right)
  end

  def sum_values_rec(node)
    return 0 if node.nil?

    node.value + sum_values_rec(node.left) + sum_values_rec(node.right)
  end

  def tree_max_rec(node)
    return 0 if node.nil?

    [node.value, tree_max_rec(node.left), tree_max_rec(node.right)].max
  end
end


bt = BinaryTree.new
0.upto(10) { |i| bt.insert(rand(100)) }

bt.display
puts "Sum of all values: #{bt.sum_values}"
puts "Max value in the tree: #{bt.tree_max}"
