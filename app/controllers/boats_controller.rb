class BoatsController < ApplicationController
  def index
    @boats = Boat.all
   end

   def new
     @boat = Boat.new
     @message = "my new boat"
   end

   def create

     @boat = Boat.create(
       name: params[:boat][:name],
       location: params[:boat][:location],
       amt_container: params[:boat][:amt_container].to_i,
       company_id: params[:boat][:company_id],
       image: params[:boat][:image]
       )
