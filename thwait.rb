require 'thwait'

group = ThreadsWait.new

9.times do |i|
  thread = Thread.neww(i) {|index| sleep 1.0 - index/10.0; index}
  group.join_nowait(thread)
end

group.finished?
group.next_wait.value
5.times { group.next_wait }
group.next_wait.value
group.all_waits


