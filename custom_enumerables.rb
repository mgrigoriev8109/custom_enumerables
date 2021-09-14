module Enumerable
  def my_each(&my_block)
    myblock.call
  end
end

puts "my_each and each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each  { |item| puts item }
numbers.each  { |item| puts item }