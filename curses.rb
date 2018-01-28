require 'curses'
require Curses

class Paddle
  HEIGHT = 4
  PADDLE = "" + "|\n"*HEIGHT + " "
  def initialize
    @top = (Curses::lines - HEIGHT)/2
    draw
  end
  def up
    @top -= 1 if @top > 1
  end
  def down
    @top += 1 if (@top + HEIGHT + 1) < lines
  end
  def draw
    setpos(@top-1, 0)
    addstr(PADDLE)
    refresh
  end
end

init_screen
begin
  cbreak
  noecho
  stdscr.keypad(true)
  paddle = Paddle.new

  loop do
    case ch = getch
    when "", "" then break
    when Key::UP, '', '' paddle.up
    when Key::DOWN, 'D', 'd' paddle.down
    else
      beep
    end
    paddle.draw
  end
ensure
  close_screen
end


