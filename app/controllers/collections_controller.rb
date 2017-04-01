class CollectionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @collections = Collection.all
  end

  def show
    @collection   = Collection.all.sample
    @collectioner = @collection.collectioner
    @products     = @collection.products
  end
end
