class CategoriesControlelr < ApplicationController
  before_action :find_category, only: [:edit, :update]

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Tạo category thành công."
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category updated"
      redirect_to admin_categories_path
    else
      render 'edit'
  end

  private

  def find_category
      @category = Category.find_by(id: params[:id])
      redirect_to admin_categories_path unless @category
  end

  def category_params
    params.require(:category).permit(:name, :type)
  end
end
