class Page
  attr_accessor :labels

  def initialize
    @labels = [
      "", "",
      "", "",
      "", "",
      "", "",
      "", "",
      "", "",
      "", ""
    ]
  end
  
  def add_label(label)
    formated_label = "#{label.name}\n#{label.address1}\n#{label.address2}\n#{label.zipcode}      #{label.city} - #{label.state}"
    @labels[label.position - 1] = formated_label
  end

end
