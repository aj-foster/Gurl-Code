class CodesController < ApplicationController

  def index

    unless can? :index, Code
      return redirect_to root_path, alert: "You aren't allowed to view codes."
    end

    @feature = Code.includes(:submissions).where(status: "Featured").first
    @queued = Code.includes(:submissions).where(status: "Queued")
    @codes = Code.includes(:submissions).where.not(status: ["Queued", "Used", "Featured"])
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

    @code = Code.create(code_params)

    if @code.save
      redirect_to codes_path, notice: "Code created successfully!"
    else
      render :new
    end
  end

  def edit

    @code = Code.find(params[:id])

    unless can? :update, @code
      return redirect_to root_path, alert: "You aren't allowed to edit codes."
    end
  end

  def update

    @code = Code.find(params[:id])

    unless can? :update, @code
      return redirect_to root_path, alert: "You aren't allowed to edit codes."
    end

    if @code.update(code_params)
      redirect_to codes_path, notice: "Code updated successfully!"
    else
      render :edit
    end
  end

  def destroy

    @code = Code.find(params[:id])

    unless can? :destroy, @code
      return redirect_to root_path, alert: "You aren't allowed to delete codes."
    end

    if @code.destroy
      redirect_to codes_path, notice: "Code removed successfully!"
    else
      redirect_to codes_path, alert: "Error: Code could not be removed."
    end
  end

  def queue

    @code = Code.find(params[:id])

    unless can? :queue, @code
      return redirect_to root_path, alert: "You aren't allowed to queue codes."
    end

    if @code.update(status: "Queued")
      redirect_to codes_path, notice: "Code queued successfully!"
    else
      redirect_to codes_path, alert: "Error: Code could not be queued."
    end
  end

  def dequeue

    @code = Code.find(params[:id])

    unless can? :dequeue, @code
      return redirect_to root_path, alert: "You aren't allowed to dequeue codes."
    end

    if @code.update(status: "")
      redirect_to codes_path, notice: "Code dequeued successfully!"
    else
      redirect_to codes_path, alert: "Error: Code could not be dequeued."
    end
  end


  private

  def code_params
    params.require(:code).permit!
  end
end
