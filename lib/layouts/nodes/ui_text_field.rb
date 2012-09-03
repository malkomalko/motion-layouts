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

    def keyboard_type(type)
      @view.keyboardType = ::UITextInputTraits::KEYBOARD_TYPES.fetchWithDefault(type)
    end

    def return_key_type(type)
      @view.returnKeyType = ::UITextInputTraits::RETURN_KEY_TYPES.fetchWithDefault(type)
    end

    def secure(bool)
      @view.setSecureTextEntry bool
    end

    def capitalize(style)
      @view.autocapitalizationType = ::UITextInputTraits::CAPITALIZATION_STYLES.fetchWithDefault(style)
    end
  end
end
