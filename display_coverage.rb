require 'coverage'
Coverage.start
STDOUT.reopen("/dev/null")
require_relative 'coverage.rb'
Coverage.result.each do |file_name, counts|
  File.readlines(file_name).each.with_index do |code_line, line_number|
    count = counts[line_number] || "--"
    STDERR.printf "%3s: %s", count, code_line
  end
end


