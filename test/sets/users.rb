module Contexts
    module Users
      # Context for users
      def create_customer_users
        @u_alexe   = FactoryBot.create(:user, first_name: "Alex",last_name: "Chen", phone: "412-553-5555", email: "kmagnussen@gmail.com")
        @u_max = FactoryBot.create(:user, first_name: "max", last_name: "vershapen", phone: "711-911-2021", email: "mv13@redbull.org")
        @u_sherry  = FactoryBot.create(:user, first_name: "sherry", last_name: "brawl", phone: "609-343-2991", email: "brawlers@supercell.org", active: false)
      end
      
      def destroy_customer_users
        @u_alexe.delete
        @u_max.delete
        @u_sherry.delete
      end
  
      def create_employee_users
        @alex        = FactoryBot.create(:user, first_name: "tank", last_name: "chen", phone: "630-334-7394", email: "tanker@gmail.com", role: "admin")
        @mark        = FactoryBot.create(:user, first_name: "mark", last_name: "scavo", phone: "201-143-7589", email: "mscavo@deshw.gov", role: "admin")
        @provider     = FactoryBot.create(:user, first_name: "laura", last_name: "grey", phone: "777-111-4567", email: "anatomy@hospital.org", role: "provider")
        # @old_shipper = FactoryBot.create(:user, username: "old_shipper", role: "shipper", active: false, greeting: "Simon")
      end
  
      def destroy_employee_users
        @alex.delete
        @mark.delete
        @provider.delete
        # @old_shipper.delete
      end
  
    end
  end