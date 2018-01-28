#pseudo terminal
#SSH
#
require 'pty'
require 'expect'

$expect_verbose = true

PTY.spawn() do |reader, writer, pid|
  reader.ecpect(/> /)
  writer.puts "'cat' .upcase"
  reader.expect("=> ")
  answer = reader.gets
  puts "Answer = #{answer}"
end

