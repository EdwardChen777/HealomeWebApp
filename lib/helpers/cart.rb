module AppHelpers
    module Cart
      # For this application, our cart is simply a hash consisting
      # of plan_ids as keys and quantities as values.  The hash is 
      # saved as a session variable that the user should have  
      # available during the course of their interactions w/ system.
  
      def create_cart
        session[:cart] ||= Hash.new
      end
  
      def clear_cart
        session[:cart] = Hash.new
      end
  
      def destroy_cart
        session[:cart] = nil
      end
  
      def add_item_to_cart(plan_id)
        if session[:cart].keys.include?(plan_id)
          # if item in cart, increment quantity by 1
          session[:cart][plan_id] += 1
        else
          # add it to the cart
          session[:cart][plan_id] = 1
        end
      end
  
      def remove_item_from_cart(plan_id)
        if session[:cart].keys.include?(plan_id)
          session[:cart].delete(plan_id)
        end
      end
  
      def calculate_cart_items_cost
        total = 0
        return total if session[:cart].empty? # skip if cart empty...
        session[:cart].each do |plan_id, quantity|
          info = {plan_id: plan_id, quantity: quantity}
          order_item = OrderItem.new(info)
          total += order_item.subtotal
        end
        total
      end
  
      def get_list_of_items_in_cart
        order_items = Array.new
        return order_items if session[:cart].empty? # skip if cart empty...
        session[:cart].each do |plan_id, quantity|
          info = {plan_id: plan_id, quantity: quantity}
          order_item = OrderItem.new(info)
          order_items << order_item
        end
        order_items    
      end
  
      def get_number_of_items
        quant = 0
        return 0 if session[:cart].empty?
        session[:cart].each do |plan_id, quantity|
          quant += quantity
        end
        return quant
      end
  
      # def update_quantity(order_item)
      #   order_item.update_attribute(:quantity)
      # end
  
      def save_each_item_in_cart(order)
        session[:cart].each do |plan_id, quantity|
          info = {plan_id: plan_id, quantity: quantity, order_id: order.id}
          OrderItem.create(info)
        end
      end
    end
  end