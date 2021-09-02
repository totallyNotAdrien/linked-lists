require_relative "linked_list.rb"


nums = (1..9).to_a



puts "list made with append"
list = LinkedList.new
nums.each {|num| list.append(num)}
puts list.to_s
puts "size: #{list.size}"
puts "head value: #{list.head.value}"
puts

puts "list made with prepend"
list = LinkedList.new
nums.each {|num| list.prepend(num)}
puts list.to_s
puts "size: #{list.size}"
puts "head value: #{list.head.value}"
