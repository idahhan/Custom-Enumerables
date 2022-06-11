module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    i = self.length - 1
    j = 0
    until i == -1
      yield(self[j])
      i -= 1
      j += 1
    end
  self
  end

  def my_each_with_index
    i = self.length - 1
    j = 0
    until i == -1
      yield(self[j],j)
      i -= 1
      j += 1
    end
  self
  end

  def my_map
    if block_given?
      new=Array.new
      i = self.length - 1
      j = 0
      until i == -1
        new[j] = yield(self[j])
        i -= 1
        j += 1
      end
      new
    else
      self.to_enum(:my_map)
    end
  end

  def my_all?
    if block_given?
      new=Array.new
      i = self.length - 1
      j = 0
      false_flag= false
      until i == -1
        new[j] = yield(self[j])
        if (new[j] && true) == false then false_flag = true end
        i -= 1
        j += 1
      end
      false_flag == true ? false : true
    else
      new = self.select { |e| (e && true) == true}
      self == new ? true : false
    end 

  end

  def my_any?
    new=Array.new
    i = self.length - 1
    j = 0
    true_flag= false
    until i == -1
      new[j] = yield(self[j])
      if (new[j] && true) == true then true_flag = true end
      i -= 1
      j += 1
    end
    true_flag == true
  end 

  def my_count
    if block_given?
      new=Array.new
      i = self.length - 1
      j = 0
      true_counter= 0
      until i == -1
        new[j] = yield(self[j])
        if (new[j] && true) == true then true_counter += 1 end
        i -= 1
        j += 1
      end
      true_counter
    else
      self.length
    end 
  end

  def my_inject(initial)
    new=Array.new
    i = self.length - 1
    j = 0
    sum= initial
    until i == -1
      sum = yield(sum, self[j])
      i -= 1
      j += 1
    end
  sum
  end

  def my_none?
    new=Array.new
    i = self.length - 1
    j = 0
    true_flag= false
    until i == -1
      new[j] = yield(self[j])
      if (new[j] && true) == true then true_flag = true end
      i -= 1
      j += 1
    end
    true_flag == false
  end

  def my_select
    new=Array.new
    i = self.length - 1
    j = 0
    until i == -1
      if yield(self[j]) == true then new.push(self[j]) end
      i -= 1
      j += 1
    end
    new
  end
end
