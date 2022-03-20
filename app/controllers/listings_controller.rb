class ListingsController < ApplicationController
  # is the user logged in
  before_action :authenticate_user!, except: [:index, :show]
  # sets variable 
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  # checking is the user id of listing matching the current user. if not it will redirect and will not render if it does match user can alter listings. 
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :set_form_vars, only: [:new, :edit]
  

# show all listings
  def index
    @listings = Listing.all
  end

  def show
    # creates a stripe session object that is stored in session variable session id stored in session id
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email:current_user && current_user.email,
      line_items: [
        {
          name: @listing.title,
          description: @listing.description,
          amount: @listing.price,
          currency: "aud", 
          quantity: 1
        }
      ],
      payment_intent_data: {
        metadata: {
          user_id: current_user && current_user.id,
          listing_id: @listing.id
        }
        
      },
      # if user wants to cancel they will be redirected to listings page
      success_url: "#{root_url}/payments/success/#{@listing.id}", 
      cancel_url: root_url

    )
    @session_id = session.id
  
  end
# create new listing
  def new
    @listing = Listing.new 
  end
# create new listings
  def create
    @listing = current_user.listings.new(listing_params) 
    if @listing.save
      redirect_to @listing, notice: "Listing successfuly created"
    else
      pp @listing.errors
      set_form_vars
      render "new", notice:"something went wrong"

  end
end 
# edit listing
  def edit

  end
# update listings and save with notice
  def update
    @listing.update(listing_params) 
    if @listing.save
      redirect_to @listing, notice: "Listing successfuly updated"
    else
      pp @listing.errors
      set_form_vars
      render "edit", notice:"something went wrong"

  end
  end 
# delete listings
  def destroy
    @listing.destroy

  end 

  private
  # features of listings 
  def listing_params
    params.require(:listing).permit(:title, :price, :category_id, :condition, :description, :picture)
  end
# unless the user is signed in and it is their own listing they cannot alter or delete the listing
  def authorize_user
    if @listing.user_id != current_user.id 
      redirect_to listings_path, alert: "You don't have permission to do that"
    end
  end 

  def set_listing
    @listing = Listing.find(params[:id])
  end 
# sets listing variables 
  def set_form_vars
 
    @categories = Category.all
    @conditions = Listing.conditions.keys
  end
  
end
