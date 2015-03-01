class Admin::PostsController < ApplicationController
  before_action :set_admin_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_administrator!
  layout "admin"
  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @admin_posts = Admin::Post.all
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
  end

  # GET /admin/posts/new
  def new
    @admin_post = Admin::Post.new
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @admin_post = Admin::Post.new(admin_post_params)

    respond_to do |format|
      if @admin_post.save
        create_or_update_tags(@admin_post, admin_post_params[:tag])
        format.html { redirect_to @admin_post, notice: 'Post criado com sucesso.' }
        format.json { render :show, status: :created, location: @admin_post }
      else
        format.html { render :new }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @admin_post.update(admin_post_params)
        format.html { redirect_to @admin_post, notice: 'Post atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_post }
      else
        format.html { render :edit }
        format.json { render json: @admin_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @admin_post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def create_or_update_tags(post, tags) 
    logger.info "AQUI ESTA O OBJETO POST =======>>>>> #{post}"
    logger.info "AQUI ESTA AS TAGAS POST =======>>>>> #{tags}"
    tags = tags.split(",").map{|tag| tag.lstrip.rstrip}
    tags.each do |tag|
      new_tag = Admin::Tag.new
      new_tag.name = tag
      if new_tag.save
        save_post_tag(post, new_tag)
      else
        new_tag = Admin::Tag.find_by_name(tag)
        save_post_tag(post, new_tag)
      end
    end
  end

  def save_post_tag(post, tag)
    post_tag = Admin::PostTag.new
    post_tag.admin_post_id = post.id
    post_tag.admin_tag_id = tag.id
    post_tag.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_post
      @admin_post = Admin::Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_post_params
      params.require(:admin_post).permit(:name, :resume, :message, :tag, :admin_category_id)
    end
end
