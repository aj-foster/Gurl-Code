class CodesController < ApplicationController

  def index

    unless can? :index, Code
      return redirect_to root_path, alert: "You aren't allowed to view codes."
    end

    @queued = Codes.where(status: "queued")
    @codes = Codes.where.not(status: ["queued", "used"])
  end

  def new

    unless can? :create, Code
      return redirect_to root_path, alert: "You aren't allowed to create codes."
    end

    @code = Code.new
  end

  def create

    unless can? :create, Code
      return redirect_to root_path, alert: "You aren't allowed to create codes."
    end

    @code = Code.create(params[:code])

    if @code.save
      redirect_to codes_path, notice: "Code created successfully!"
    else
      render :new
    end
  end

  def edit

    unless can? :update, Code
      return redirect_to root_path, alert: "You aren't allowed to edit codes."
    end

    @code = Code.find(params[:id])
  end

  def update

    unless can? :update, Code
      return redirect_to root_path, alert: "You aren't allowed to edit codes."
    end

    @code = Code.find(params[:id])

    if @code.update(params[:code])
      redirect_to codes_path, notice: "Code updated successfully!"
    else
      render :edit
    end
  end

  def destroy

    unless can? :destroy, Code
      return redirect_to root_path, alert: "You aren't allowed to delete codes."
    end

    @code = Code.find(params[:id])

    if @code.destroy
      redirect_to codes_path, notice: "Code removed successfully!"
    else
      redirect_to codes_path, alert: "Error: Code could not be removed."
    end
  end
end
