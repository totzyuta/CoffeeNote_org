class Admin::BaseController < ApplicationController
  layout 'admin'
  # TODO: implement ApplicationHelper#require_admin_user
  # before_filter :require_admin_user
end
