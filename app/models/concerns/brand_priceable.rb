require "active_support/concern"

module BrandPriceable
  extend ActiveSupport::Concern

  def brand_price
    case brand_type
    when 'envisage'
      price
    when 'envisage_trade'
      trade_price
    when 'my_office_branding', 'my_vehicle_wrap'
      my_price
    end
  end

  def brand_rush_job_price
    case brand_type
    when 'envisage'
      rush_job_price
    when 'envisage_trade'
      trade_rush_job_price
    when 'my_office_branding', 'my_vehicle_wrap'
      my_rush_job_price
    end
  end
end