require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def test_it_exists
    assert Node
  end

  def test_it_has_a_value
    n = Node.create(:value => 6)
    assert_equal 6, n.value
  end

  def test_it_has_a_left
    n = Node.create(:value => 6)
    n2 = Node.create(:value => 2)
    n.left = n2
    n.save!
    assert_equal n2, n.left
  end

  def test_it_has_a_right
    n = Node.create(:value => 6)
    n2 = Node.create(:value => 10)
    n.right = n2
    n.save!
    assert_equal n2, n.right
  end

  def test_it_inserts_a_node_to_the_left
    n = Node.create(:value => 6)
    value2 = 2
    n.insert(value2)
    assert_equal 2, n.left.value
  end

  def test_it_inserts_a_node_to_the_right
    n = Node.create(:value => 6)
    value2 = 10
    n.insert(value2)
    assert_equal 10, n.right.value
  end

  def test_it_inserts_two_nodes_to_the_left
    n = Node.create(:value => 6)
    n.insert(4)
    n.insert(2)
    assert_equal 2, n.left.left.value
  end

  def test_it_inserts_two_nodes_to_the_right
    n = Node.create(:value => 6)
    n.insert(8)
    n.insert(10)
    assert_equal 10, n.right.right.value
  end

  def test_it_counts_one_node
    n = Node.create(:value => 6)
    assert_equal 1, n.count
  end

  def test_it_counts_one_node_with_a_left
    n = Node.create(:value => 6)
    n.insert(2)
    assert_equal 2, n.count
  end

  def test_it_counts_one_node_with_a_right
    n = Node.create(:value => 6)
    n.insert(10)
    assert_equal 2, n.count
  end

  def test_it_counts_one_node_with_two_leaves
    n = Node.create(:value => 6)
    n.insert(10)
    n.insert(2)
    assert_equal 3, n.count
  end

  def test_it_counts_several_levels_of_a_tree
    n = Node.create(:value => 6)
    [4, 2, 1, 3, 8, 10].each do |i|
      n.insert(i)
    end
    assert_equal 7, n.count
  end

  def test_it_has_a_min
    n = Node.create(:value => 6)
    assert_equal 6, n.min
  end

  def test_it_has_a_min_with_right_children
    n = Node.create(:value => 6)
    n.insert(10)
    n.insert(12)
    assert_equal 6, n.min
  end

  def test_it_has_a_min_with_left_child
    n = Node.create(:value => 6)
    n.insert(2)
    assert_equal 2, n.min
  end

  def test_it_has_a_min_with_two_left_children
    n = Node.create(:value => 6)
    n.insert(4)
    n.insert(2)
    assert_equal 2, n.min
  end

  def test_it_finds_the_correct_min_in_a_bunch_of_noise
    n = Node.create(:value => 6)
    [3, 4, 5, 1, 2].each do |i|
      n.insert(i)
    end
    assert_equal 1, n.min
  end

  def test_it_finds_the_correct_max_in_a_bunch_of_noise
    n = Node.create(:value => 6)
    [7, 5, 2, 4, 10, 14, 16, 11, 1].each do |i|
      n.insert(i)
    end
    assert_equal 16, n.max
  end
end
