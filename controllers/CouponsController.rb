class CouponsController < ApplicationController

  get '/' do

    @coupons = Coupons.all
    erb :coupons_index
    end
  end
