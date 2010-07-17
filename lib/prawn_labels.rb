# labels.rb :  A simple helper to generate labels for Prawn PDFs
#
# Copyright February 2010, Jordan Byron. All Rights Reserved.
#
# This is free software. Please see the LICENSE and COPYING files for details.

require 'rubygems'
require 'prawn'
require 'yaml'
require 'prawn/layout'
require "prawn/measurement_extensions"

module Prawn    
  class Labels
    attr_reader :document, :type
    
    def self.generate(file_name, data, guide, options = {}, &block)                               
      labels = Labels.new(data, guide, options,&block)
      
      labels.document.render_file(file_name)
    end
    
    def initialize(data, guide, options={}, &block)
      types_file = File.join(File.dirname(__FILE__), 'models.yml')
      types      = YAML.load_file(types_file)
      
      @guide = guide
      
      unless @type = types[options[:type]]
        raise "Label Type Unknown '#{options[:type]}'" 
      end
      
      @label_width = type["label_width"]
      @label_height = type["label_height"]
      
      @document = Document.new  :page_size => type["page_size"],
                                :top_margin  => type["top_margin"].cm,
                                :bottom_margin  => type["bottom_margin"].cm,
                                :left_margin  => type["left_margin"].cm, 
                                :right_margin => type["right_margin"].cm

      generate_grid @type
      
      data.each_with_index do |record, i|
        create_label(i, record) do |pdf, record|
          yield pdf, record
        end
      end
      
    end
    
    private
    
    def generate_grid(type)
      
      @document.instance_eval do
        define_grid  :columns       => type["columns"], 
                     :rows          => type["rows"], 
                     :column_gutter => type["column_gutter"].cm,
                     :row_gutter    => type["row_gutter"].cm
      end
    end
  
    def row_col_from_index(i)
      index = (@document.page_number - 1) * (@document.grid.rows * @document.grid.columns)
      
      @document.grid.rows.times do |r|    
        @document.grid.columns.times do |c|
          if index == i
            return [r,c]
          else
            index += 1
          end
        end
      end
      
      @document.start_new_page
      generate_grid @type
      [0,0]
    end
  
    def create_label(i,record,&block)
      p = row_col_from_index(i)
      
      #
      # @document.stroke_color = "000000"
      
      # @document.fill_and_stroke do
      #   @document.rectangle [300,300], 100, 200
      # end
      #
      
      if @guide
              
        @document.stroke_color = "000000"
        @document.stroke do
          @document.horizontal_line 10.3.cm, 10.5.cm, :at => 23.7.cm
          @document.vertical_line 23.7.cm, 23.5.cm, :at => 10.4.cm
        
          @document.horizontal_line 10.3.cm, 10.5.cm, :at => 0.cm
          @document.vertical_line 0.cm, 0.2.cm, :at => 10.4.cm
        end
    
      end

      b = @document.grid(p.first, p.last)
      @document.bounding_box b.top_left, :width => @label_width.cm, :height => @label_height.cm do
        
        #
        # @document.stroke do
        #
        # @document.rectangle(@document.bounds.top_left, @document.bounds.width, @document.bounds.height)
      
        @document.indent(30) do
          yield(@document, record)
        end
        
        #
        # end

      end
    end
  end
end