require 'prawn_labels'

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
        pdf.text label, :size => 10, :valign => :center
      end
    end
end
