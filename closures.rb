#adder
adder = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    adder.call(acc + arr.first, arr.drop(1))
  end
end

#counter
class Counter
  def initalize
    @x = 0
  end

  def get_x
    @x
  end

  def incr
    @x += 1
  end

  def decr
    @x -= 1
  end
end

#lambda_counter
Counter = lambda do
  x = 0
  get_x = lambda { x }
  incr = lambda { x += 1 }
  decr = lambda { x += 1 }

  {get_x: get_x, incr: incr, decr: decr}
end

#multiplier
multiplier = lambda do |acc, arr|
  if arr.empty?
    acc
  else
    multiplier.call(acc * arr.first, arr.drop(1))
  end
end

#notifier
class Notgier
  attr_reader :generator, :callbacks

  def initialize(generator, callback)
    @generator = generator
    @callback = callback
  end

  def run
    result = generator.run
    if result
      callback.fetch(:on_success).call(result)
    else
      callback.fetch(:on_failure).call
    end
  end
end

#reducer
reduce = lambda do |acc, arr, binary_function|
  reducer_aux = lambda do |acc, arr|
    if arr.empty?
      acc
    else
      reducer_aux.call(binary_function.call(acc, arr.first), arr.drop(1))
    end
  end

  reducer_aux.call(acc, arr)
end

reducer.call(1, [1,2,3,4,5], lambda { |x, y| x + y }) #=> 16

#reducer
reducer = lambda do |acc, arr, binary_function|
  reducer_aux = lambda do |acc, arr|
    if arr.empty?
      acc
    else
      reducer_aux.call(binary_function.call(acc, arr.first), arr.drop(1))
    end
  end

  reducer_aux.call(acc, arr)
end

reducer.call(1, [1,2,3,4,5], lambda{ |x, y| x + y }) #=> 16


