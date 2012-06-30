class UITextField
  BORDER_STYLES = {
    default: UITextBorderStyleRoundedRect,
    none: UITextBorderStyleNone,
    line: UITextBorderStyleLine,
    bezel: UITextBorderStyleBezel,
    rounded: UITextBorderStyleRoundedRect
  }
end

class UITextInputTraits
  KEYBOARD_TYPES = {
    default: UIKeyboardTypeDefault,
    ascii: UIKeyboardTypeASCIICapable,
    numbers: UIKeyboardTypeNumbersAndPunctuation,
    url: UIKeyboardTypeURL,
    number_pad: UIKeyboardTypeNumberPad,
    phone_pad: UIKeyboardTypePhonePad,
    name_phone_pad: UIKeyboardTypeNamePhonePad,
    email: UIKeyboardTypeEmailAddress,
    decimal_pad: UIKeyboardTypeDecimalPad,
    twitter: UIKeyboardTypeTwitter
  }

  RETURN_KEY_TYPES = {
    default: UIReturnKeyDefault,
    go: UIReturnKeyGo,
    google: UIReturnKeyGoogle,
    join: UIReturnKeyJoin,
    next: UIReturnKeyNext,
    route: UIReturnKeyRoute,
    search: UIReturnKeySearch,
    send: UIReturnKeySend,
    yahoo: UIReturnKeyYahoo,
    done: UIReturnKeyDone,
    emergency: UIReturnKeyEmergencyCall
  }

  CAPITALIZATION_STYLES = {
    default: UITextAutocapitalizationTypeNone,
    none: UITextAutocapitalizationTypeNone,
    words: UITextAutocapitalizationTypeWords,
    sentences: UITextAutocapitalizationTypeSentences,
    all: UITextAutocapitalizationTypeAllCharacters
  }
end
