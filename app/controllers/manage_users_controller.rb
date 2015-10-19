class ManageUsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /quotes.json
  def index
  	# binding.pry
    # @users = User.paginate(page: params[:page]).includes(:user)
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  # def new
  #   @quote = Quote.new
  # end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  # def create
  #   @quote = Quote.new(quote_params.merge!(user_id: current_user.id))

  #   respond_to do |format|
  #     if @quote.save
  #       format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
  #       format.json { render :show, status: :created, location: @quote }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @quote.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @user.update(user_params.merge!(user_id: current_user.id))
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:message, :genre)
    end

end
