class Admin::BlogsController < Admin::AdminController
  before_filter :get_referer, :only => [:edit]

  def index
    @blogs = Blog.order(:created_at).all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])

    if @blog.save
      redirect_to admin_blogs_path
    else
      render :new
    end
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      flash[:success] = 'You have successfully updated the blog'
      redirect_to session[:return_to]
    else
      flash[:error] = @blog.errors.full_messages.join('<br/>')
      render :edit
    end
  end

  # def destroy
  #   @blog = Blog.find(params[:id])
  #   @blog.destroy

  #   redirect_to blogs_url
  # end

  private

    def get_referer
      session[:return_to] = request.referer
    end
end
