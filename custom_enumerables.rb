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

  def my_none?
    return_value = true
    if block_given?
      for element in self do
        if (yield element) == true
          return_value = false
        end
      end
      return_value
    else
      puts self
    end
  end

  def my_count
    return_count = 0
    if block_given?
      for element in self do
        if (yield element) == true
          return_count += 1
        end
      end
      return_count
    else
      puts self
    end
  end

  def my_map
    new_array=[]
    if block_given?
      for element in self do
        new_array.push(yield element)
      end
      new_array
    else
      puts self
    end
  end

  def my_inject
    accumulator = self[0]
    if block_given?
      for element in self[1..-1] do
        accumulator = yield(accumulator, element)
      end
      accumulator
    else
      puts self
    end
  end
  
end

words = [2, 4, 5]
p "test1"
p words.my_inject { |accumulator, number| accumulator * number }
p "test2"
p words.inject { |accumulator, number| accumulator * number }
