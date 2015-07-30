class CouponsController < ApplicationController
  ##title, description, product, discount, exp_date


##list all the coupons
  get '/' do

    @coupons = CouponsModel.all
    erb :coupons_index
    end


##create coupons
    get '/create' do
      erb :coupons_create
    end

    post '/create' do
      @coupon = CouponsModel.new
      # params contains any object posted as a name
      @coupon.title = params[:title] # binds to <input name='title'>
      @coupon.description = params[:description]
      @coupon.product = params[:product]
      @coupon.discount = params[:discount]
      @coupon.exp_date = params[:exp_date]
      @coupon.save
      erb :coupons_create_success
    end

  ##update (edit) coupons
  get '/edit/:id' do
    #localhost/coupons/edit/ID
    @id = params[:id]
    @coupon = CouponsModel.find(@id)

    erb :coupons_edit
  end

  post '/edit' do
    @coupon = CouponsModel.find(params[:id])
    @coupon.title = params[:title]
    @coupon.description = params[:description]
    @coupon.product = params[:product]
    @coupon.discount = params[:discount]
    @coupon.exp_date = params[:exp_date]
    @coupon.save

    erb :coupons_edit_success
  end
  ##delete (destroy) coupons
  post '/delete' do
   @id = params[:id]
   @coupon = CouponsModel.find(@id)
   @coupon.destroy

   erb :coupons_delete_success
  end
end
