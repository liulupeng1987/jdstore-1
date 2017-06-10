class Admin::CategoryGroupsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @category_groups = CategoryGroup.all
  end

  def show
    @category_group = CategoryGroup.find(params[:id])
  end

  def new
    @category_group = CategoryGroup.new
  end

  def create
    @category_group = CategoryGroup.new(category_group_params)

    if @category_group.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category_group = CategoryGroup.find(params[:id])
  end

  def update
    @category_group = CategoryGroup.find(params[:id])

    if @category_group.update(category_group_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  private

  def category_group_params
    params.require(:category_group).permit(:name, :description)
  end

end
