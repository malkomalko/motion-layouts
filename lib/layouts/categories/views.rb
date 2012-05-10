class UIView
  RESIZE_MASKS = {
    none: UIViewAutoresizingNone,
    top: UIViewAutoresizingFlexibleBottomMargin,
    right: UIViewAutoresizingFlexibleLeftMargin,
    bottom: UIViewAutoresizingFlexibleTopMargin,
    left: UIViewAutoresizingFlexibleRightMargin,
    width: UIViewAutoresizingFlexibleWidth,
    height: UIViewAutoresizingFlexibleHeight
  }

  def resizeMask(*masks)
    self.autoresizingMask = RESIZE_MASKS[:none] and return self if masks.include?(:none)
    self.autoresizingMask = masks.reduce(0) {|memo,mask| memo | RESIZE_MASKS.fetch(mask, 0)}
    self
  end

  def resizeAll
    self.resizeMask :top, :right, :bottom, :left, :width, :height
  end

  def fromLayout(klass, controller)
    _views_ = klass.layout(self, controller)
    _views_.each {|_view_| self.addSubview _view_}
  end

  def initWithParent(parent)
    @parent = parent
    self.initWithFrame [[0,0],[0,0]]
  end
end

module LayoutHelper
  def height(height=50)
    height = height.is_a?(Float) ?
      @parent.bounds.size.height * height : height
    self.frame = update_dimensions h: height
  end

  def width(width=50)
    width = width.is_a?(Float) ?
      @parent.bounds.size.width * width : width
    self.frame = update_dimensions w: width
  end

  def left(left=0)
    left = left.is_a?(Float) ?
      @parent.bounds.size.width * left : left
    self.frame = update_dimensions x: left
  end

  def top(top=0)
    top = top.is_a?(Float) ?
      @parent.bounds.size.height * top : top
    self.frame = update_dimensions y: top
  end

  def align(align='left')
    width_left = @parent.bounds.size.width - self.frame.size.width

    case align
    when 'left'
      self.frame = self.update_dimensions x: 0
    when 'center'
      self.frame = self.update_dimensions x: width_left / 2
    when 'right'
      self.frame = self.update_dimensions x: width_left
    end
  end

  def verticalAlign(align='top')
    height_left = @parent.bounds.size.height - self.frame.size.height

    case align
    when 'top'
      self.frame = self.update_dimensions y: 0
    when 'center'
      self.frame = self.update_dimensions y: height_left / 2
    when 'bottom'
      self.frame = self.update_dimensions y: height_left
    end
  end

  def update_dimensions(opts={})
    x = opts.fetch(:x, self.frame.origin.x)
    y = opts.fetch(:y, self.frame.origin.y)
    w = opts.fetch(:w, self.frame.size.width)
    h = opts.fetch(:h, self.frame.size.height)
    [[x, y], [w, h]]
  end
end
