module Layouts
  class LayoutBase
    def self.method_missing(klass, *args, &block);end

    def self.alloc(template, klass, controller)
      klass = Module.const_get(klass)
      @parent = template.instance.view
      @controller = controller
      _defaults = base_defaults.merge(defaults)
      origin = [0, 0]
      size = [_defaults[:width], _defaults[:height]]

      klass.alloc.initWithFrame [origin, size]
    end

    def self.base_defaults
      {
        width: @parent.bounds.size.width,
        height: 50
      }
    end

    def self.defaults
      {}
    end

    def initialize(template, view, controller, &block)
      @parent = template.instance.view
      @view = view
      @controller = controller
      @args = self.class.base_defaults
      instance_eval &block
    end

    def id(id)
      @controller.class.send(:attr_accessor, id)
      @controller.instance_variable_set "@#{id}", @view
    end

    def height(height=50)
      height = height.is_a?(Float) ?
        @parent.bounds.size.height * height : height
      @args[:height] = height
      @view.frame = update_dimensions h: height
      anchor('bottom') if @args[:anchor] == 'bottom'
    end

    def width(width=50)
      width = width.is_a?(Float) ?
        @parent.bounds.size.width * width : width
      @args[:width] = width
      @view.frame = update_dimensions w: width
    end

    def left(left=0)
      left = left.is_a?(Float) ?
        @parent.bounds.size.width * left : left
      @args[:left] = left
      @view.frame = update_dimensions x: left
    end

    def top(top=0)
      top = top.is_a?(Float) ?
        @parent.bounds.size.height * top : top
      @args[:top] = top
      @view.frame = update_dimensions y: top
    end

    def align(align='left')
      width_left = @parent.bounds.size.width - @view.frame.size.width

      case align
      when 'left'
        @view.frame = update_dimensions x: 0
      when 'center'
        @view.frame = update_dimensions x: width_left / 2
      when 'right'
        @view.frame = update_dimensions x: width_left
      end
    end

    def background_color(color='FFFFFF')
      @view.backgroundColor = Color.from_hex(color)
    end

    def text_color(color='FFFFFF')
      if @view.respond_to?(:textColor)
        @view.textColor = Color.from_hex(color)
      end
    end

    def delegate(instance)
      if @view.respond_to?(:delegate) && !instance.nil?
        @view.delegate = instance
      end
    end

    def resize(*masks)
      @view.resizeMask(*masks)
    end

    def update_dimensions(opts={})
      x = opts.fetch(:x, @view.frame.origin.x)
      y = opts.fetch(:y, @view.frame.origin.y)
      w = opts.fetch(:w, @view.frame.size.width)
      h = opts.fetch(:h, @view.frame.size.height)
      [[x, y], [w, h]]
    end
  end
end
