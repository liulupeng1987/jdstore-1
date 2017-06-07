class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :find_category_by_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "分类#{@category.name}保存成功"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "分类#{@category.name}已更新"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "分类#{@category.name}已删除"
    redirect_to admin_categories_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def find_category_by_id
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end
end
