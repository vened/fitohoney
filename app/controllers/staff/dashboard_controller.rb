class Staff::DashboardController < Staff::StaffController
  def show
    @dashboard = nil
    @orders = Order.all
  end
end
