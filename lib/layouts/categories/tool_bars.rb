class UIToolbar
  def self.createAtTop(view, height=50)
    self.alloc.initWithFrame([[0,0], [view.bounds.size.width,height]])
  end

  def self.createAtBottom(view, height=50)
    size = view.bounds.size
    bottom = size.height - height
    self.alloc.initWithFrame([[0,bottom], [size.width,height]])
  end
end
