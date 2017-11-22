class VeteransController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_veteran, only: [:show, :edit, :update, :destroy]


  # GET /veterans
  # GET /veterans.json
  def index
    @veterans = Veteran.all
  end

  # GET /veterans/1
  # GET /veterans/1.json
  def show
    @veteran = Veteran.find(params[:id])
  end

  # GET /veterans/new
  def new
    @veteran = Veteran.new
  end

  # GET /veterans/1/edit
  def edit
  end

  # POST /veterans
  # POST /veterans.json
  def create
    @veteran = Veteran.new(veteran_params)

    respond_to do |format|
      if @veteran.save
        format.html { redirect_to @veteran, notice: 'Veteran was successfully created.' }
        format.json { render :show, status: :created, location: @veteran }
      else
        format.html { render :new }
        format.json { render json: @veteran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veterans/1
  # PATCH/PUT /veterans/1.json
  def update
    @veteran = Veteran.find(params[:id])
    respond_to do |format|
      if @veteran.update(veteran_params)
        format.html { redirect_to @veteran, notice: 'Veteran was successfully updated.' }
        format.json { render :show, status: :ok, location: @veteran }
      else
        format.html { render :edit }
        format.json { render json: @veteran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veterans/1
  # Used solely for veterans signing up for Connect
  def connect_sign_up
    @veteran = Veteran.find(params[:id])
    if @veteran.update(veteran_connect_signup_params)
      render json: @veteran
    else
      render json: @veteran.errors, status: :unprocessable_entity
    end
  end

  # DELETE /veterans/1
  # DELETE /veterans/1.json
  def destroy
    @veteran.destroy
    respond_to do |format|
      format.html { redirect_to veterans_url, notice: 'Veteran was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veteran
      @veteran = Veteran.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veteran_params
      params.require(:veteran).permit(:first_name,
                                      :last_name,
                                      :email,
                                      :on_connect)
    end

    def veteran_connect_signup_params
      params.require(:veteran).permit(:military_branch,
                                      :unit,
                                      :notes,
                                      :accept_messages,
                                      :share_profile,
                                      :accept_notices,
                                      :on_connect)
    end

end
