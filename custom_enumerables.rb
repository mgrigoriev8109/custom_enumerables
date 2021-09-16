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
    if block_given?
      for element in self do
        return false if (yield element) == true
        return true if (yield element) == false
      end
    else
      puts self
    end
  end

  def my_any?

  end
end

words = ['ant', 'bear', 'c']
p "test1"
p words.my_all? { |word| word.length >= 2  }
p "test2"
p words.all? { |word| word.length >= 2}
