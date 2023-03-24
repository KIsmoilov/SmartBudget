class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_operation, only: %i[show edit update destroy]

  # GET /operations or /operations.json
  def index
    @group = current_user.groups.find(params[:group_id])
    @operations = @group.operations.order(created_at: :desc)
  end

  # GET /operations/1 or /operations/1.json
  def show; end

  # GET /operations/new
  def new
    @operation = Operation.new
    @group = Group.find(params[:group_id])
    @categories = Group.where(user_id: current_user.id)
  end

  # GET /operations/1/edit
  def edit; end

  # POST /operations or /operations.json
  def create
    params = operation_params
    @operation = Operation.new(name: params[:name], amount: params[:amount])
    @operation.user = current_user
    @categories_ids = params[:group_ids]
    @categories_ids.each do |id|
      group = Group.find(id) unless id == ''
      @operation.groups.push(group) unless group.nil?
    end

    respond_to do |format|
      if @operation.save
        format.html do
          redirect_to group_operations_path(@operation.groups.first.id), notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        format.html { redirect_to operation_url(@operation), notice: 'Operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: [])
  end
end
