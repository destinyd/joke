class ApplicationController < ActionController::Base
  protect_from_forgery
  add_crumb I18n.t("site_title"), '/'
end
