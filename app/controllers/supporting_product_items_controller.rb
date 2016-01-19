class SupportingProductItemsController < ApplicationController
  before_action :set_print_job, only: [:new, :create]
  before_action :set_supporting_product_item, only: [:edit, :update, :destroy]

  def new
    @supporting_product_item = SupportingProductItem.new
  end

  def create
    @supporting_product_item = @print_job.supporting_product_items.new(supporting_product_item_params)
    if @supporting_product_item.save
      redirect_to @print_job, notice: "Supporting product item successfully added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @supporting_product_item.update(supporting_product_item_params)
      redirect_to @supporting_product_item.print_job, notice: "Supporting product item successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @supporting_product_item.destroy
    redirect_to @supporting_product_item.print_job, notice: "Supporting product item successfully destroyed"
  end

  private

  def set_print_job
    @print_job = PrintJob.find(params[:print_job_id])
  end

  def set_supporting_product_item
    @supporting_product_item = SupportingProductItem.find(params[:id])
  end

  def supporting_product_item_params
    params.require(:supporting_product_item).permit(:area, :supporting_product_id)
  end
end