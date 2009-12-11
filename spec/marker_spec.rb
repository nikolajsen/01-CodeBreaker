require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Marker do
  context 'non-positional matches' do
    before do
      secret = %w(r y g b)
      @marker = Marker.new(secret)
    end
    it '0 matches should return []' do
      @marker.guess(%w(c c c c))
      @marker.mark.should == []
    end
    
    it "1 matches should return ['m']" do
      @marker.guess(%w(b c c c))
      @marker.mark.should == ['m']
    end
    
    it "2 matches should return ['m','m']" do
      @marker.guess(%w(b g c c))
      @marker.mark.should == ['m','m']
    end

    it "3 matches should return ['m','m', 'm']" do
      @marker.guess(%w(b g y c))
      @marker.mark.should == ['m','m','m']
    end
    
    it "4 matches should return ['m','m','m','m']" do
      @marker.guess(%w(b g y r))
      @marker.mark.should == ['m','m','m','m']
    end
  end
  
  context 'positional matches' do
    before do
      secret = %w(r y g b)
      @marker = Marker.new(secret)
    end
    
    it "will return ['p'] with one match" do
      @marker.guess(%w(r c c c))
      @marker.mark.should == ['p']
    end
    
    it "will return ['p','p'] with two matches" do
      @marker.guess(%w(r y c c))
      @marker.mark.should == ['p','p']
    end
    
    it "will return ['p','p','p'] with three matches" do
      @marker.guess(%w(r y g c))
      @marker.mark.should == ['p','p','p']
    end
    
    it "will return ['p','p','p','p'] with four matches" do
      @marker.guess(%w(r y g b))
      @marker.mark.should == ['p','p','p','p']
    end
  end

  context 'mixed matches' do
    before do
      secret = %w(r y g b)
      @marker = Marker.new(secret)
    end
    
    it "1 positional mixed with 1 match should return ['p','m']" do
      @marker.guess(%w(r b c c))
      @marker.mark.should == ['p','m']
    end

    it "1 match mixed with 1 positional should return ['p','m']" do
      @marker.guess(%w(b y c c))
      @marker.mark.should == ['p','m']
    end
    
    it "2 match mixed with 2 positional should return ['p','p','m','m']" do
      @marker.guess(%w(b y g r))
      @marker.mark.should == ['p','p','m','m']
    end
  end
end