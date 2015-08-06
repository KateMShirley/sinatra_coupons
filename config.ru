require 'sinatra/base'

Dir.glob('./{controllers,models}/*.rb').each {
|file| require file
}

map('/') {run HomeController}
map('/coupons') {run CouponsController}
map('/users') {run UsersController}
