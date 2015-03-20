class CodesController < ApplicationController

  def index
    @queued = Codes.where(status: "queued")
    @codes = Codes.where.not(status: ["queued", "used"])
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.create(params[:code])

    if @code.save
      redirect_to codes_path, notice: "Code created successfully!"
    else
      render :new
    end
  end

  def edit
    @code = Code.find(params[:id])
  end

  def update
    @code = Code.find(params[:id])

    if @code.update(params[:code])
      redirect_to codes_path, notice: "Code updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @code = Code.find(params[:id])

    if @code.destroy
      redirect_to codes_path, notice: "Code removed successfully!"
    else
      redirect_to codes_path, alert: "Error: Code could not be removed."
    end
  end
end
