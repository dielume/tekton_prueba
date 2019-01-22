class Api::PurchaseOrdersController < Api::BaseController
  before_action :set_purchase_order, only: [:show, :status]

  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = current_user.purchase_orders
    @purchase_orders = @purchase_orders.map{ |purchase_order| purchase_order.attributes }
    render json: @purchase_orders
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    authorize @purchase_order
    render json: @purchase_order.attributes
  end

  def status
    authorize @purchase_order
    render json: {purchase_order: @purchase_order.slice(:id, :status)}
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.user = current_user
    @purchase_order.status = "Espera"

    if @purchase_order.save
      render json: {status: "created", purchase_order: @purchase_order.attributes}
      # render :show, status: :created, location: @purchase_order
      # format.html { redirect_to purchase_orders_path, notice: 'Purchase order was successfully created.' }
      # format.json { render :show, status: :created, location: @purchase_order }
    else
      render json: @purchase_order.errors, status: :unprocessable_entity
      # format.html { render :new }
      # format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
    end
  end


  # DELETE /purchase_orders/1

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:description, :status, :category,
                                             :shipping_date, :reception_date, :address)
    end
end
