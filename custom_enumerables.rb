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

  def my_select
    new_array=[]
    if block_given?
      for element in self do
        if (yield element) == true
          new_array.push(element)
        end
      end
      new_array
    else
      puts self
    end
  end

  def my_all?
    return_value = true
    if block_given?
      for element in self do
        if (yield element) == false
          return_value = false
        end
      end
      return_value
    else
      puts self
    end
  end

  def my_any?
    return_value = false
    if block_given?
      for element in self do
        if (yield element) == true
          return_value = true
        end
      end
      return_value
    else
      puts self
    end
  end

end

words = ['ant', 'b', 'cear']
p "test1"
p words.my_any? { |word| word.length >= 5  }
p "test2"
p words.any? { |word| word.length >= 5}
