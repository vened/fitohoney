class Staff::StaffController < ApplicationController
  before_action :authenticate_admin!
  layout 'staff/layouts/staff_layout'
end
