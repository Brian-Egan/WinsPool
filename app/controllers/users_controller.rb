class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  include UsersHelper

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

        respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # {"utf8"=>"✓", "authenticity_token"=>"AS4EjE53ZO13TKDZSXwJvMCn4vgecYamoeFeT0NChRE=", "user"=>{"owner"=>"Bobby", "email"=>"bfegan@gmail.com", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Create User"}
    @user = User.new(user_params)
    # @user = User.new(:owner => params[:owner], :email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    # puts @user
    # @user.save

    respond_to do |format|
      if @user.save
        @auth_user = @user
        format.html { redirect_to @user, notice: 'Your spot in the league has been reserved!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new', notice: 'Glargenbargens!' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def modal
    @user = User.find(params[:userID])
    puts @user.owner

    respond_to do |format|
      format.js
    end
  end

  def standings
      @users = User.by_rank
      @updatedAt = Schedule.maximum('updated_at')
    respond_to do |format|
      format.html
      format.js
    end
  end


  def setNewWeek

    puts "~~~~hey!~~~~~~"
    @rankings = User.all.sort_by{|x| [x.wins, -x.losses]}.reverse
    setUsersForNewWeek(@rankings)
    # render nothing: true
    render file: 'users/setNewWeek.js.coffee'

  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:owner, :draft_order, :password, :password_confirmation, :email)
    end
end
