class ImdbPlotKeyword
  attr_accessor :link, :name
  
  def initialize(name, link)
    self.name = name;
    self.link = link;
  end
end
