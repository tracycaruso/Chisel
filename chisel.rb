class Chisel

document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appreared in **Food & Wube** this place has been packed every night."'

  def parser

  end

  def parse_h1(line)
    if line[0] == "#"
      line.sub("#", "<h1>").insert(-1, "</h1>")
    end
  end

  def parse_h2(line)
    if line[0..1] == "##"
      line.sub("##", "<h2>").insert(-1, "</h2>")
    end
  end

  def parse_h3(line)
    if line[0..2] == "###"
      line.sub("###", "<h3>").insert(-1, "</h3>")
    end
  end

  def parse_h4(line)
    if line[0..3] == "####"
      line.sub("####", "<h4>").insert(-1, "</h4>")
    end
  end

  def parse_h5(line)
    if line[0..4]
      line.sub("#####", "<h5>").insert(-1, "</h5>")
    end
  end

  def parse_p(line)
    if line[0] != "#"
      line.insert(0, "<p>")
      line.insert(-1, "</p>")
   end
  end

end

#parser = Chisel.new
#output = parser.parse(document)
#puts output


# <h1>My Life in Desserts</h1>
# <h2> Chapter 1: The Beginning</h2>
# <p>"You just have to try the cheesecake," he said. "Ever since it appreared in **Food & Wube** this place has been packed every night."</p>
