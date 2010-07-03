require 'prawn_labels'

class Label
  attr_accessor :position, :name, :address1, :address2, :zipcode, :city, :state

  def initialize(position, name, address1, address2, zipcode, city, state)
    @position, @name, @address1, @address2, @zipcode, @city, @state = position, name, address1, address2, zipcode, city, state
  end

end

class Page
  attr_accessor :labels

  def initialize
    @labels = Array.new(14)
  end
  
  def add_label(label)
    formated_label = "#{label.name}\n#{label.address1}\n#{label.address2}\n#{label.zipcode}      #{label.city} - #{label.state}"
    @labels[label.position - 1] = formated_label
  end

end

class Document
    attr_accessor :pages, :model

    def initialize(model = "pimaco6082", pages = [])
      @model, @pages = model, pages
    end

    def add_page(page)
      @pages << page
    end

    def print(file = "page.pdf")
      labels = []
      @pages.each do |page|
        page.labels.each do |label|
          labels << label
        end
      end
      Prawn::Labels.generate(file, labels, :type => @model) do |pdf, label|
        label ||= ""
        pdf.text label, :size => 10, :valign => :center
      end
    end
end