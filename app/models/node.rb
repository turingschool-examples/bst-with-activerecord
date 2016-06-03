class Node < ActiveRecord::Base
  belongs_to :left, :class_name => Node
  belongs_to :right, :class_name => Node

  def insert(other)
    newbie = Node.create(:value => other)
    insert_node(newbie)
  end

  def insert_node(other)
    if other.value < self.value
      insert_node_left(other)
    else
      insert_node_right(other)
    end
  end

  def insert_node_left(other)
    if left
      left.insert_node(other)
    else
      self.left = other
    end
  end

  def insert_node_right(other)
    if right
      right.insert_node(other)
    else
      self.right = other
    end
  end

  def count
    total = 1
    total += left.count if left
    total += right.count if right
    return total
  end

  def min
    if left
      left.min
    else
      self.value
    end
  end

  def max
    if right
      right.max
    else
      self.value
    end
  end
end
