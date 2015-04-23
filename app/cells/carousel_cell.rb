class CarouselCell < Cell::Rails

  def top
    @carousel = Carousel.all
    render
  end

end
