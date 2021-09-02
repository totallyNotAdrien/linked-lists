require_relative "linked_list.rb"

nums = (1..9).to_a

#--------------------APPEND----------------------------------
puts "list made with append"
list = LinkedList.new
nums.each {|num| list.append(num)}
puts list.to_s

puts "list2 made with prepend"
list2 = LinkedList.new
nums.each {|num| list2.prepend(num)}
puts list2.to_s

puts "size: #{list.size}"
puts "head value: #{list.head.value}"
puts "tail value: #{list.tail.value}"

node = list.at(5)
puts "value at index 5: #{node ? node.value : "nil"}"
node = list.at(8)
puts "value at index 8: #{node ? node.value : "nil"}"
node = list.at(9)
puts "value at index 9: #{node ? node.value : "nil"}"

while list.head
  puts "list after popping #{list.pop.value}:"
  puts list.to_s
  puts
end

list = LinkedList.new
nums.each {|num| list.append(num)}
puts "list contains 10? #{list.contains?(10)}"
puts "list contains 7? #{list.contains?(7)}"
puts

puts "index of the value '4': #{list.find(4).inspect}"
puts "index of the value '14': #{list.find(14).inspect}"
puts

list.insert_at(14,5)
puts "insert 14 at index 5: #{list.to_s}"

list.insert_at(1, 13)
puts "insert 1 at index 13: #{list.to_s}"

list.insert_at(62, 0)
puts "insert 62 at index 0: #{list.to_s}"
puts

list.remove_at(0)
puts "remove index 0: #{list.to_s}"

list.remove_at(list.size-1)
puts "remove last: #{list.to_s}"

list.remove_at(5)
puts "remove index 5: #{list.to_s}"