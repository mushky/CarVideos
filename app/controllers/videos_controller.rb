class VideosController < ApplicationController
  def index
    if params[:search]
      @videos = Video.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @videos = Video.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(videos_params)
		if @video.save
			redirect_to @video
		else
			render 'new'
		end
	end

	def show
		@video = Video.find(params[:id])
	end

	def edit
		@video = Video.find(params[:id])
	end

	def update
		@video = Video.find(params[:id])
		if @video.update(videos_params)
			redirect_to @video
		else
			render 'edit'
		end
	end		

	def destroy
		@video = Video.find(params[:id])
		@video.destroy

		redirect_to videos_path
	end

	private
		def videos_params
			params.require(:video).permit(:name, :description, :url)
		end

end