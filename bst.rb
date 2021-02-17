#module Comparable
class Node
    attr_accessor :data, :left_child, :right_child

    def initialize(data)
        @data = data
        @left_child = nil
        @right_child = nil
        
    end
end

class Tree
    attr_accessor :root, :data

    def initialize(arr)
        @arr = arr
        @root = build_tree(arr)
    end

    def build_tree(arr, first = 0, last = arr.length - 1)
        return nil if first > last
        arr.sort.uniq
        mid_point = (first + last)/2
        node = Node.new(arr[mid_point])

        node.left_child = build_tree(arr, first, mid_point - 1)
        node.right_child = build_tree(arr, mid_point + 1, last)
        node
    end

    def insert(value, node = @root)
        return node if value == node.data
            
        if value < node.data
            node.left_child.nil? ? insert(value, node.left_child) : node.left_child = Node.new(value)
        elsif value >  node.data
            node.right_child.nil? ? insert(value, node.right_child) : node.right_child = Node.new(value)
        end
    end


    def delete(value, node = @root)
        return node if node.nil?

        if value < node.data
            node.left_child = delete(value, node.left_child)
        elsif value > node.data
            node.right_child = delete(value, node.right_child)
        end

        if value == node.data 
            if node.left_child.nil?
                #copied_node = node
                node = node.right_child
                #delete copied_node
                #return node
            elsif node.right_child.nil?
                #copied_node = node
                node = node.left_child
                #delete copied_node
                #return node

            else
                node.data = min_val(node.right_child)
                #node.data = copied_node.data
                node.right_child = delete(node.data, node.right_child)
            end
        end
        return node
    end

    def min_val(node)
        node = @head

        min_value = node.data
        while node.left_child
            min_value = node.left_child.data
            node = left_child
        end
        min_value
    end

    def find(value, node = @root)
        return node if node.nil? || value == node.data
            
        #return node if node.nil? || node.data == value

        value < node.data ? find(value, node.left_child) : find(value, node.right_child)

    end

    def level_order(node = @root)
        i = 0
        
        return if node.nil?

        queue = [node]
        level_order_arr = []

        while queue[i]
            level_order_arr << queue[i].data
            queue << queue[i].left_child if queue[i].left_child
            queue << queue[i].right_child if queue[i].right_child
            i += 1
        end
        level_order_arr
    end

    def inorder(node = @root, array = [])

        return array if node.nil?

        inorder(node.left_child, array)
        array << node.data
        inorder(node.right_child, array)
        array

    end

    def preorder(node = @root, array = [])
        
        return array if node.nil?
        array << node.data
        preorder(node.left_child, array)
        preorder(node.right_child, array)
        array

    end

    def postorder( node = @root, array = [])
       
        return array if node.nil?

        postorder(node.left_child, array)
        postorder(node.right_child, array)
        array << node.data
        array

    end

    def height(node = @root)

        unless node.nil? || node == @root
            node = (node.instance_of?(Node) ? find(node.data) : find(node))
        end
      
        return -1 if node.nil?
      
        [height(node.left_child), height(node.right_child)].max + 1
        #return 0 if node.nil? #|| node.left_child.nil? || node.right_child.nil?
        
        #if node.left_child
            #h_left =  height(node.left_child)
        #elsif node.right_child
            #h_right = height(node.right_child)
        #end
        #h_left > h_right ? h_left + 1 : h_right + 1
           
    end

    def depth(node = @root, parent = @root, edges = 0)
        return 0 if node == parent
        return -1 if parent.nil?
    
        if node < parent.data
          edges += 1
          depth(node, parent.left_child, edges)
        elsif node > parent.data
          edges += 1
          depth(node, parent.right_child, edges)
        else
          edges
        end
    end

    def balanced?(node = @root)
        
        if node.nil?
            return true
        else

            h_left = height(node.left_child)
            h_right = height(node.right_child)

            if (h_left - h_right).abs <= 1 && balanced?(node.left_child) && balanced?(node.right_child)
                return true
            else
                return false
            end
        end
    end

    def rebalance
        #@data = inorder_array
        @root = build_tree(level_order)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
    end

end

  
   
 



    