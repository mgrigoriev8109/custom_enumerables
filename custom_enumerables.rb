module Enumerable
  def my_each
    if block_given?
      for element in self do
        yield element
      end
    else
      puts self
    end
  end
end

p "my_each and each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each 
numbers.each  { |item| p item }
