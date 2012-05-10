module Layouts
  class UITextField < LayoutBase
    def self.defaults
      {
        width: @parent.bounds.size.width * 0.90,
        height: 30
      }
    end

    def border_style(style)
      @view.borderStyle = ::UITextField::BORDER_STYLES.fetchWithDefault(style)
    end

    def placeholder(text)
      @view.placeholder = text
    end
  end
end
