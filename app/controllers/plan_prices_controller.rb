class PlanPricesController < ApplicationController
    def new 
        @plan_price = PlanPrice.new
        @plan = Plan.find(params[:plan_id])
    end

    def create
        @plan_price = PlanPrice.new(plan_price_params)
        @plan_price.start_date = Date.current
        @plan_price.price = @plan_price.price*1 unless @plan_price.price.nil?
        if @plan_price.save
            flash[:notice] = "Successfully updated the price."
            redirect_to plan_path(@plan_price.plan)
        else
            @plan = Plan.find(params[:plan_price][:plan_id])
            render action: 'new', locals: {plan: @plan}
        end
    end

    private
    def plan_price_params 
        params.require(:plan_price).permit(:plan_id, :price, :start_date, :end_date)
    end
end
