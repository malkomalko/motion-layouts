class Color
  def self.from_hex(color='FFFFFF')
    color = color.length == 6 ? color : 'FFFFFF'
    r, g, b = [color[0..1].to_i(16), color[2..3].to_i(16), color[4..5].to_i(16)]
    UIColor.colorWithRed(r/255.0,green:g/255.0,blue:b/255.0,alpha:1)
  end
end
