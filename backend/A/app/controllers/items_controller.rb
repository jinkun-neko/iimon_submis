class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]

# GET /items
# GET /items.json
def index
  @items = Item.order(created_at: :desc)
  render json: { status: :success, items: @items }
end

# GET /items/1
# GET /items/1.json
def show
  render json: { status: :success, items: @item }
end

# POST /items
# POST /items.json
def create
@item = Item.new(item_params)
if @item.save
  render :show, json: { status: 200, message: "success" },location: @item
  # render :show, status: :ok, message: 'success',location: @item
else
  render json: @item.errors, status: :unprocessable_entity
end
end

# PATCH/PUT /items/1
# PATCH/PUT /items/1.json
def update
  if @item.update(item_params)
    render :show, status: :ok, location: @item
  else
    render json: @item.errors, status: :unprocessable_entity
  end
end

# DELETE /items/1
# DELETE /items/1.json
def destroy
  @item.destroy
end

private
# Use callbacks to share common setup or constraints between actions.
def set_item
    @item = Item.find(params[:id])
end

  # Only allow a list of trusted parameters through.
def item_params
  params.require(:item).permit(:name, :price, :genre_id)
end
end