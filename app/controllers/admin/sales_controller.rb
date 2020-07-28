class Admin::SalesController < ApplicationController

  def index
    @sales = Sale.order(starts_on: :asc)
    @active_sale = Sale.active.first
  end

  def new
    @sale = Sale.new
    @active_sale = Sale.active.first
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], notice: 'Sale created!'
    else
      render :new
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Sale deleted!'
  end

  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :percent_off,
      :starts_on,
      :ends_on
    )
  end
end
