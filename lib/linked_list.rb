require_relative "node.rb"

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @tail
      @tail.next_node = node
      @tail = node
    else
      @head = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    if @head
      node.next_node = @head
      @head = node
    else
      @head = node
      @tail = node
    end
  end

  def size
    return 0 unless @head

    len = 0
    curr = @head
    while curr
      len += 1
      curr = curr.next_node
    end
    len
  end

  def at(index)
    return nil if !@head || index < 0
    return @head if index == 0

    curr_index = 0
    curr = @head
    while curr && curr_index < index
      curr = curr.next_node
      curr_index += 1
    end
    curr
  end

  def pop
    return nil unless @head

    if @head == @tail
      temp = @head
      @head = nil
      @tail = nil
      temp
    elsif @head.next_node == @tail
      temp = @tail
      @head.next_node = nil
      @tail = @head
      temp
    else
      curr = @head
      while curr.next_node != @tail
        curr = curr.next_node
      end
      temp = @tail
      @tail = curr
      @tail.next_node = nil
      temp
    end
  end

  def contains?(value)
    return false unless @head
    return true if @head.value == value || @tail.value == value

    curr = @head
    while curr
      return true if curr.value == value
      curr = curr.next_node
    end
    false
  end

  def find(value)
    return nil unless @head
    return 0 if @head.value == value

    index = 0
    curr = @head
    while curr
      return index if curr.value == value
      curr = curr.next_node
      index += 1
    end
    nil
  end

  def to_s
    curr = @head
    output = ""
    while curr
      output << "( #{curr.value} ) -> "
      curr = curr.next_node
    end
    output << "nil"
    output
  end

  def insert_at(value, index)
    if index <= 0
      prepend(value)
      return
    end

    if index >= size
      append(value)
      return
    end

    curr_index = 0
    curr = @head
    while curr_index < index - 1
      curr = curr.next_node
      curr_index += 1
    end

    node = Node.new(value)
    node.next_node = curr.next_node
    curr.next_node = node
  end

  def remove_at(index)
    len = size
    return unless @head
    return if index < 0 || index >= len

    if index == 0
      @head = @head.next_node
      return
    end

    if index == len - 1
      pop
      return
    end

    curr_index = 0
    curr = @head
    while curr_index < index - 1
      curr = curr.next_node
      curr_index += 1
    end

    left = curr
    to_remove = left.next_node
    right = to_remove.next_node
    if right
      left.next_node = right
    else
      @tail = left
      @tail.next_node = nil
    end
  end
end
