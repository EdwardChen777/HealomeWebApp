class CartController < ApplicationController
    include AppHelpers::Cart
    # include AppHelpers::Shipping

    # before_action :check_login

    def show_items
        @items_in_cart = get_list_of_items_in_cart()
        # @subtotal = calculate_cart_items_cost()
        # @shipping_cost = calculate_cart_shipping
        # @total = @subtotal + @shipping_cost
        @total = calculate_cart_items_cost()
        @test = get_number_of_items()
    end 

    def add_item 
        @plan = Plan.find(params[:id])
        add_item_to_cart(params[:id])
        #redirect_to add_item_path 
        redirect_to plan_path(@plan)
        flash[:notice] = "#{@plan.name} was added to cart."
    end

    def remove_item
        @item = Plan.find(params[:id])
        remove_item_from_cart(params[:id])
        redirect_to view_cart_path
        flash[:notice] = "#{@plan.name} was removed from cart."
    end

    def empty_cart
        clear_cart
        redirect_to view_cart_path
        flash[:notice] = "Cart is emptied."
    end 

    def checkout 
        @items_in_cart = get_list_of_items_in_cart()
        # @subtotal = calculate_cart_items_cost()
        # @shipping_cost = calculate_cart_shipping()
        # @total = @subtotal + @shipping_cost
        @total = calculate_cart_items_cost()
        @user = current_user
        @addresses = @user.customer.addresses
        @order = Order.new
        flash[:notice] = "Thank you for ordering from Healome."
    end
end
