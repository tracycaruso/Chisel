class Chisel

  def parse(line)
    #broken_lines = break_line(line)
    #headered_broken_lines = parse_headers(broken_lines)
    #final_parsed_lines = parse_paragraphs(headered_broken_lines)

    "Test input"
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

  end

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appreared in **Food & Wube** this place has been packed every night."'


  def parse_h1(line)
      line.sub("#", "<h1>").insert(-1, "</h1>")
  end

  def parse_h2(line)
      line.sub("##", "<h2>").insert(-1, "</h2>")
  end

  def parse_h3(line)
      line.sub("###", "<h3>").insert(-1, "</h3>")
  end

  def parse_h4(line)
      line.sub("####", "<h4>").insert(-1, "</h4>")
  end

  def parse_h5(line)
      line.sub("#####", "<h5>").insert(-1, "</h5>")
  end

  def parse_p(line)
    if line[0] != "#" || "<"
      line.insert(0, "<p>")
      line.insert(-1, "</p>")
   end
  end



  def break_line(line)
    line.lines.map(&:chomp).reject{|l| l.empty?}
  end





end



#
# parser = Chisel.new
# output = parser.parse(document)
# puts output


# <h1>My Life in Desserts</h1>
# <h2> Chapter 1: The Beginning</h2>
# <p>"You just have to try the cheesecake," he said. "Ever since it appreared in **Food & Wube** this place has been packed every night."</p>
