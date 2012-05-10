module Kernel
  def delegateTo(selector)
    if self.respond_to?(:delegate) && !self.delegate.nil?
      self.delegate.send(selector) if self.delegate.respond_to?(selector)
    end
  end
end

class Hash
  def fetchWithDefault(key)
    self.fetch(key, self[:default])
  end
end

class Numeric
  def percent
    self.to_f / 100.0
  end
end

class NSOrderedSet
  def push(val)
    self.addObject(val)
  end

  def size
    self.count
  end

  def [](index)
    self.objectAtIndex(index)
  end
end

class NSMutableOrderedSet
  def delete_at(index)
    self.removeObjectAtIndex(index)
  end
end
