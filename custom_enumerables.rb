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

  def my_map(proc_argument = false)
    new_array=[]
    for element in self do
      if proc_argument
        new_array.push(proc_argument.call(element))
      else
        new_array.push(yield(element))
      end
    end
    new_array
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

def multiply_els(array)
  array.my_inject { |accumulator, number| accumulator * number }
end

map_proc = Proc.new  { |i| i*i }
numbers = [1, 2, 3, 4, 5]
words = ['cat', 'dog', 'banana']

puts "#my_each vs each"
numbers.my_each { |item| puts item }
numbers.each { |item| puts item }

puts "#my_each_with_index vs each_with_index"
numbers.my_each_with_index { |item, index| puts "item: #{item}, index: #{index}" }
numbers.each_with_index { |item, index| puts "item: #{item}, index: #{index}" }

p "#my_select vs select"
p numbers.my_select { |num|  num.even?  } 
p numbers.select { |num|  num.even?  } 

p "#my_all? vs all?"
p numbers.my_all? { |num|  num.even?  } 
p numbers.all? { |num|  num.even?  } 

p "#my_any? vs any?"
p numbers.my_any? { |num|  num.even?  } 
p numbers.any? { |num|  num.even?  } 

p "#my_none? vs none?"
p numbers.my_none? { |num|  num.even?  } 
p numbers.none? { |num|  num.even?  } 

p "#my_count vs count"
p numbers.my_count  { |num| num > 1 }
p numbers.count { |num| num > 1 }

p "#my_map vs map proc"
p numbers.my_map(map_proc)
p numbers.map { |num| num*num }

p "my_map vs map block"
p numbers.my_map { |num| num*num }
p numbers.map { |num| num*num }

p "#my_inject vs inject"
p numbers.my_inject { |sum, number| sum + number } 
p numbers.inject { |sum, number| sum + number } 

p "#multiply_els"
p multiply_els(numbers)