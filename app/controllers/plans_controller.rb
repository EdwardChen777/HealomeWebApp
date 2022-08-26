class PlansController < ApplicationController
    before_action :set_plan, only: [:show, :edit, :update, :destroy, :toggle_blood_test, :toggle_past_results, :toggle_wearables]
    # before_action :check_login, except: [:index]
    # authorize_resource

    def create
        @plan = Plan.new(plan_params)
    if @plan.save
        redirect_to plan_path(@plan), notice: "#{@plan.name} was added to the system."
    else
        render action: 'new'
    end
  end

  def edit
  end

  def index
    @all = Plan.all 
  end

  def new
    @plan = Plan.new
  end

  def show
    @prices = @plan.plan_prices.chronological.to_a
  end

  def toggle_blood_test
    if @plan.has_blood_tests
        @item.no_blood_test
        flash[:notice] = "#{@plan.name} does not include blood test"
    else
        @item.add_blood_test
        flash[:notice] = "#{@plan.name} include blood test"
    end
    redirect_back fallback_location:home_path
  end

  def toggle_past_results
    if @plan.can_upload_past_results
        @plan.update_attribute(:can_upload_past_results, false)
        flash[:notice] = "#{@plan.name} can no longer upload past test results"
    else
        @plan.update_attribute(:can_upload_past_results, true)
        flash[:notice] = "#{@plan.name} now includes past test result analysis"
    end
    redirect_back fallback_location:home_path
  end

  def toggle_wearables
    if @plan.includes_wearables
        @plan.update_attribute(:includes_wearables, false)
        flash[:notice] = "#{@plan.name} no longer includes free wearable products"
    else
        @plan.update_attribute(:includes_wearables, true)
        flash[:notice] = "#{@plan.name} now includes wearable products"
    end
    redirect_back fallback_location:home_path
  end

  def update
    if @plan.update_attributes(plan_params)
      redirect_to plan_path(@plan)
    else
      render action: 'edit'
    end
  end

  def destroy 
    # if @plan.destroy
    #   flash[:notice] = "Successfully removed #{@plan.name}."
    #   redirect_to plans_path
    # else
    #   @prices = @plan.plan_prices.chronological
    #   redirect_to plan_path(@plan)
    # end
    @plan.destroy
    flash[:notice] = "Successfully removed #{@plan.name}."
    redirect_to plans_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_plan
    @plan = Plan.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def plan_params
    params.require(:plan).permit(:name, :description, :biomarkers, :has_blood_tests, :can_upload_past_results, :includes_wearables)
  end
end
