class HeaderCell < Cell::Rails

  def show
    # @pages = Page.roots
    # @current_page = Page.find_by_path(params[:id])
    # if @current_page
    #   @root_page = @current_page.root
    # end
    @order = Order.find_by(session_id: session[:session_id])
    render
  end

end
