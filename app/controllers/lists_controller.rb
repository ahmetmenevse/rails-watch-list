class ListsController < ApplicationController
  before_action :set_list, only: [:show, :create]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: "List was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.new(params[:list_id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
