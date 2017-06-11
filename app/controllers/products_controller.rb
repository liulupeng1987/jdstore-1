class ProductsController < ApplicationController

  def index

    @products = case params[:category]
    when 'PADI课程'
      Product.where(:category_id => 1)
    when 'PSAI课程'
      Product.where(:category_id => 2)
    when '船宿行程'
      Product.where(:category_id => 3)
    when '度假行程'
      Product.where(:category_id => 4)
    when '入门装备'
      Product.where(:category_id => 5)
    when '进阶装备'
      Product.where(:category_id => 6)
    when '课程'
      Product.where(:category_id => [1, 2])
    when '行程'
      Product.where(:category_id => [3, 4])
    when '装备'
      Product.where(:category_id => [5, 6])
    else
      @products = Product.rank(:row_order).all
    end
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
    @review = Review.new
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end

    redirect_to :back
  end

end
