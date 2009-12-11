class Marker
  def initialize(secret)
    @secret = secret
  end
  def guess(these)
    @these = these
  end
  def mark
    initial = []
    @these.each_with_index do |item, idx|
      if @secret[idx] == item
        initial << 'p'
      elsif @secret.include?(item)
        initial << 'm'
      end
    end
    initial.sort.reverse
    #these.inject([]) { |accum, item| accum << 'm' if @secret.include?(item); accum }
  end
end
