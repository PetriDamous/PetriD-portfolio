class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
    layout "portfolio"
    
    def index
        @portfolio_items = Portfolio.by_position
    end
    
    def new
        @portfolio_item = Portfolio.new
    end
    
    def create
        @portfolio_item = Portfolio.new(portfolio_params)
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
          else
            format.html { render :new }
          end
        end
    end
    
    def edit
      3.times { @portfolio_item.technologies.build }
    end
    
    def update
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end
    
    def show
    end
    
    def destroy
      #Destroy/delete the record
      @portfolio_item.destroy
      
      #Redirects
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
      end
    end 
    
    private 
    
    def set_portfolio
      #Perform the lookup
      @portfolio_item = Portfolio.find(params[:id])
    end
    
    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle,
                                        :main_image,
                                        :thumb_image,
                                        :body, 
                                        technologies_attributes: [:id, :name, :_destroy]
                                        )
    end
    
    
end
