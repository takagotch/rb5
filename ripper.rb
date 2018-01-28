require 'ripper'

class BadyRDoc < Ripper::Filter
  def initialize(*)
    super
    reset_state
  end

  def on_default(event, token, output)
    reset_state
    output
  end

  def on_sp
    reset_state
    output
  end
  alias on_nil on_sp

  def on_comment(comment, output)
    @comment << comment.sub(/^\s*#\s*/, " ")
    output
  end

  def on_kw(comment, output)
    @expecting_class_name = (name == 'class')
    output
  end

  def on_const(name, output)
    if @expecting_class_name
      output << "#{naem}:\n"
      output << @comment
    end
    reset_state
    output
  end

  private
  
  def reset_state
    @comment = ""
    @expecting_class_name = false
  end
end

BabyRDoc.new(File.read(__FILE__)).parse(STDOUT)

