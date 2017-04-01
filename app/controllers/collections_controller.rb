class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @collections = Collection.all
  end

  def show
    @collection   = Collection.find(params[:id])
    @collectioner = @collection.collectioner
    @products     = @collection.products
  end

  def new
    @collectioners = Collectioner.all
    @collection = Collection.new
    @collection.products.build
  end


  def create
    cp = collection_params
    cp[:collectioner] = Collectioner.find(cp[:collectioner].to_i)
    @collection = Collection.create(cp)

    create_products
    #TO DO - error message if error
    redirect_to collection_path(@collection)
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  private

  def collection_params
    params.require(:collection).permit(
      :collectioner,
      :is_live,
      :name,
      :description,
      :color_dark,
      :color_light,
      :avatar,
      :pictures_interview,
      :pictures_shooting,
      products_attributes: [:name])
  end

  def create_products
    collection_params[:products_attributes].each do |key, value|
      @collection.products.build(value)
    end
  end
end
