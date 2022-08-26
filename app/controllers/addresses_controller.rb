class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :edit, :update, :destroy]

    def index
        @active_addresses = Address.by_recipient.paginate(page: params[:page]).per_page(15)
        @inactive_addresses = Address.by_recipient.paginate(page: params[:page]).per_page(15)
    end
    
    def new
        @address = Address.new
    end
    
    def show
    end
    
    def update
        if @address.update_attributes(address_params)
          redirect_to addresses_path
        else
          render action: 'edit'
        end
    end
    
    def edit
    end

    def create
        @address = Address.new(address_params)
        if @address.save
          flash[:notice] = "The address was added to #{@address.customer.proper_name}."
          redirect_to customer_path(@address.customer)
        else
          render action: 'new'
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
        @address = Address.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
        params.require(:address).permit(:recipient, :street_1, :street_2, :city, :state, :zip, :active, :is_billing, :customer_id)
    end
end
