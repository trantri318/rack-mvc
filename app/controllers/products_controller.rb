class ProductsController < Frack::BaseController
  def index # GET
    @products = Product.all
  end

  def new # GET
    @product = Product.new
  end

   def create # POST
    @product = Product.new product_params

    if @product.save
      redirect('/products')
    else
      render('products/new')
    end
  end

  private

  def product_params
    request.params['product']
  end
end
