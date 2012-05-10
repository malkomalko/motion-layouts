class ExpectingHashParameter < StandardError
  def initialize(msg='First parameter must be a hash')
    super
  end
end

class MissingViewException < StandardError
  def initialize(msg='Please include a :view class')
    super
  end
end
