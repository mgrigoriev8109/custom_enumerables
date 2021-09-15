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

  def my_each_with_index
    if block_given?
      for element in self do
        yield element, self.index(element)
      end
    else
      puts self
    end
  end    
end

p "my_each and each"
numbers = [1, 2, 3, 4, 5]
numbers.my_each_with_index  { |item, index| p "item #{item} for index #{index}" }
numbers.each_with_index  { |item, index| p "item #{item} for index #{index}" }
