class ImagesController < ApplicationController
  before_action :set_image, only: :create
  before_action :set_user, only: :show
  def index
    @galeria = {}
    User.all.each do |u|
      @galeria.store( u.username , u.images)
    end
    #@images = Image.order(created_at: :desc).limit(15)
  end

  def show
    @image=@user.images.find(params[:id])
    #@image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  # def create
  #   @image= current_user.images.build(image_params)
  #   if @images.save
  #     redirect_to image_path(@image.id), notice: "Imagen subida exitosamente"
  #   else
  #     render :new
  #   end
  # end
  # upload=ActionDispatch::Http::UploadedFile.new({
  #   :filename => params['image']['image'].original_filename,
  #   :type => params['image']['image'].content_type,
  #   :tempfile => File.new(params['image']['image'].tempfile)  
  # })
  # uploader= ImageUploader.new(upload,:store)
  # uploader.upload(upload) 
  #@image = S3Store.new(params[:image][:image]).store
  #@image= ImageUploader.new(Base64.encode64(File.new(params['image']['image']).read))
  # @image= Image.new(image: @file, user: current_user, description: params[:description])
  def create
    @image= current_user.images.build(image_params)
    @image.image=@file
    if @image.save
      redirect_to image_path(@image), notice: "Imagen subida exitosamente"
    else
      render :new
    end
  end
  
  private

  def image_params
    params.require(:image).permit(:image,:description)  
  end
  def set_image
    @file=File.new(params['image']['image'])
  end
  def set_user
    if params[:username]
      @user=User.where(username: params[:username]).first
    else 
      @user=current_user
    end
  end
end