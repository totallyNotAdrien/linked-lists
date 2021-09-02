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
end