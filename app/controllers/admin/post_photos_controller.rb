class Admin::PostPhotosController < ApplicationController
  before_action :set_admin_post_photo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_administrator!
  layout "admin"
  # GET /admin/post_photos
  # GET /admin/post_photos.json
  def index
    @admin_post_photos = Admin::PostPhoto.all
  end

  # GET /admin/post_photos/1
  # GET /admin/post_photos/1.json
  def show
  end

  # GET /admin/post_photos/new
  def new
    @admin_post_photo = Admin::PostPhoto.new
  end

  # GET /admin/post_photos/1/edit
  def edit
  end

  # POST /admin/post_photos
  # POST /admin/post_photos.json
  def create
    @admin_post_photo = Admin::PostPhoto.new(admin_post_photo_params)

    respond_to do |format|
      if @admin_post_photo.save
        format.html { redirect_to @admin_post_photo.post, notice: 'Foto cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @admin_post_photo }
      else
        format.html { render :new }
        format.json { render json: @admin_post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/post_photos/1
  # PATCH/PUT /admin/post_photos/1.json
  def update
    respond_to do |format|
      if @admin_post_photo.update(admin_post_photo_params)
        format.html { redirect_to @admin_post_photo, notice: 'Foto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_post_photo }
      else
        format.html { render :edit }
        format.json { render json: @admin_post_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/post_photos/1
  # DELETE /admin/post_photos/1.json
  def destroy
    @admin_post_photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_post_photos_url, notice: 'Foto excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post_photo
      @admin_post_photo = Admin::PostPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_post_photo_params
      params.require(:admin_post_photo).permit(:title, :photo, :admin_post_id)
    end
end
