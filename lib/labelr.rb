require 'prawn_labels'

module Labelr

  class Document

    def initialize(model)
      @model = model
      model_info = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'models.yml')))[model.to_s]
      model_rows = model_info['rows'].to_i
      model_columns = model_info['columns'].to_i
      @labels_by_page =  model_rows * model_columns
      @labels = Array.new(@labels_by_page)
    end

    def labels=(labels)
      pages = pages_qty(labels.size, @labels_by_page)
      total_blank_labels = @labels_by_page * pages
      
      @labels = Array.new(total_blank_labels)      
      labels.each_index do |i|
        @labels[i] = labels[i]
      end
    end
  
    def print
      Prawn::Labels.generate('document.pdf', @labels, false, :type => @model.to_s) do |pdf, label|
        label ||= ""
        pdf.text label, :size => 10, :valign => :center
      end
    end
    
    protected
  
    def pages_qty(labels_qty, labels_by_page)
      pages = labels_qty / @labels_by_page
      pages += 1 if  (labels_qty % @labels_by_page) > 0
      pages
    end
  
  end

  class Page
  
    def initialize(model)
      @model = model
      model_info = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), 'models.yml')))[model.to_s]
      model_rows = model_info['rows'].to_i
      model_columns = model_info['columns'].to_i
      labels_by_page =  model_rows * model_columns
      @labels = Array.new(labels_by_page)
    end
    
    def add_label_at_position(position, label)
      @labels[position - 1] = label
    end
    
    def print
      Prawn::Labels.generate('page.pdf', @labels, false, :type => @model.to_s) do |pdf, label|
        label ||= ""
        pdf.text label, :size => 10, :valign => :center
      end
    end

  end

end