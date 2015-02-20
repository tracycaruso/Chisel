class Chisel

  def parse(line)
    array_of_lines = break_line(line)
    cycle_through_lines(array_of_lines)
    single_words = break_line_to_words(array_of_lines)
    cycle_through_words(single_words)
    convert_to_string(single_words)
  end

  def break_line(line)
    line.lines.map(&:chomp).reject{|l| l.empty?}
  end

  def cycle_through_lines(line)
    line = line.map{|l| parse_p(l)}
    line = line.map{|l| parse_headers(l)}
  end

  def cycle_through_words(line)
    line.map{|l| parse_asterisks(l)}
  end

  def parse_p(line)
    if !(line[0] == "#" || line[0] == "<")
      line.insert(0, "<p>")
      line.insert(-1, "</p>")
      puts "paragraph"
    end
  line
  end


  def parse_asterisks(line)
    if line[0..1] == "**"
      parse_strong_first(line)
    elsif line[0] == "*"
      parse_emphasis_first(line)
    elsif line[-2..-1] == "**"
      parse_strong_last(line)
    elsif line[-1] == "*"
      parse_emphasis_last(line)
    end
  end

  def convert_to_string(line)
    line.join(" ")
  end


  def break_line_to_words(line)
    line.join(" ").split
  end

  def parse_strong_first(line)
     line.sub!("**", "<strong>")
  end

  def parse_emphasis_first(line)
      line.sub!("*", "<em>")
  end

  def parse_strong_last(line)
      line.sub!("**", "</strong>")
  end

  def parse_emphasis_last(line)
      line.sub!("*", "</em>")
  end

  def parse_headers(line)
    if line[0..4] == "#####"
      parse_h5(line)
    elsif line[0..3] == "####"
      parse_h4(line)
    elsif line[0..2] == "###"
      parse_h3(line)
    elsif line[0..1] == "##"
      parse_h2(line)
    elsif line[0] == "#"
      parse_h1(line)
    end
    line
  end

  def parse_h1(line)
    puts "h1"
      line.sub!("#", "<h1>").insert(-1, "</h1>")
  end

  def parse_h2(line)
    puts "h2"
      line.sub!("##", "<h2>").insert(-1, "</h2>")
  end

  def parse_h3(line)
      puts "h3"
      line.sub!("###", "<h3>").insert(-1, "</h3>")
  end

  def parse_h4(line)
    puts "h4"
      line.sub!("####", "<h4>").insert(-1, "</h4>")
  end

  def parse_h5(line)
    puts "h5"
      line.sub!("#####", "<h5>").insert(-1, "</h5>")
  end

end

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appreared in **Food & Wine** this place has been packed every night."'

parser = Chisel.new
output = parser.parse(document)
#print output
print output
