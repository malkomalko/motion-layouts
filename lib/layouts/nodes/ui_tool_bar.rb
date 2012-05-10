module Layouts
  class UIToolbar < LayoutBase
    def self.defaults
      {
        height: 50
      }
    end

    def anchor(type)
      type ||= 'top'
      @args[:anchor] = type
      bottom = @parent.bounds.size.height - @args[:height]
      @view.frame = update_dimensions y: type == 'bottom' ? bottom : 0
    end

    def items(toolbar_items)
      items = toolbar_items.map do |item|
        if item[0].is_a?(String)
          ::UIBarButtonItem.createTitle(item[0], @controller, item[1])
        elsif item[0].is_a?(Symbol)
          ::UIBarButtonItem.createType(item[0], @controller, item[1])
        end
      end.compact
      @view.items = items
    end
  end
end
