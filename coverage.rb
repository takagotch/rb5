1.upto(100).with_object() do |i, x|
  if i % 3 == 0
    i += 'Cover'
  end
  if i % 5 == 0
    x += 'age'
  end
  if x.empty?
    puts i
  else
    puts x
  end
end

