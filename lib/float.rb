class Float
  def round_price(places)
    temp = self.to_s.length
    return sprintf("%#{temp}.#{places}f", self).to_f
  end
end