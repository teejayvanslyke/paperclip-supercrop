require File.dirname(__FILE__) + '/spec_helper.rb'

describe Paperclip::Supercrop do
  
  def image(name)
    File.open(File.dirname(__FILE__) + '/images/' + name + '.png')
  end

  def rmagick_image(file)
    Magick::Image.read(file).first
  end

  def process(image_name, options={})
    supercrop = Paperclip::Supercrop.new(image(image_name), options)
    Magick::Image.read(supercrop.make.path).first
  end

  it 'should be a Paperclip::Processor' do
    Paperclip::Supercrop.superclass.should == Paperclip::Processor
  end

  describe '- When processing an image with the same aspect ratio as the processor' do

    before { @image = process('100x100', :width => 50, :height => 50) }

    it 'should resize the image to the new dimensions' do
      @image.columns.should == 50
      @image.rows.should == 50
    end
  end

  describe '- When processing an image with a different aspect ratio from the processor' do

    context 'and no gravity is specified' do
      before { @image = process('100x100', :width => 50, :height => 100) }

      it 'should resize the image to the new dimensions and clip the edges evenly' do
        @image.columns.should == 50
        @image.rows.should    == 100
      end
    end

    context 'and north gravity is specified' do
      before :each do
        @image = process('100x100', :width => 100, :height => 50, :gravity => :north)
      end

      it 'should resize the image to the new dimensions and clip the edges evenly' do
        @image.columns.should == 100 
        @image.rows.should    == 50
      end
    end

  end

end

