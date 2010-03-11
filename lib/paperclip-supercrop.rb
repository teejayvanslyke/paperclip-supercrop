$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'paperclip'
require 'rmagick'

module Paperclip
  class Supercrop < Processor

    VERSION = '0.0.1'

    def initialize(file, options={})
      @file    = file
      @options = options
    end

    def make
      reset_file_position

      image_to_file(
        image.crop_resized(width, height, gravity)
      )
    end

    protected

    def width
      @options[:width] || image.columns
    end

    def height 
      @options[:height] || image.rows
    end

    def gravity
      case @options[:gravity]
      when :forget
        Magick::ForgetGravity
      when :northwest
        Magick::NorthWestGravity
      when :north
        Magick::NorthGravity
      when :northeast
        Magick::NorthEastGravity
      when :west
        Magick::WestGravity
      when :center
        Magick::CenterGravity
      when :east
        Magick::EastGravity
      when :southwest
        Magick::SouthGravity
      when :southeast
        Magick::SouthEastGravity
      else
        Magick::CenterGravity
      end
    end

    def image
      Magick::Image.read(@file).first
    end

    def basename
      File.basename(@file.path)
    end

    def image_to_file(image)
      file = Tempfile.new([ basename, 'png' ].compact.join('.'))
      image.write('png:' + file.path)
      return file
    end

    def reset_file_position
      @file.pos = 0
    end
  end
end
