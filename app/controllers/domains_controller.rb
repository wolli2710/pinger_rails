class DomainsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index]
  before_filter :check_user, :only => [:edit, :update, :destroy]

  def index
    @domains = Domain.all
  end

  def show
  end

  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new( params[:domain] )
    @domain.user = current_user
    if @domain.save
      Subscriber.create(:email => current_user.email, :domain_id => @domain.id);
      redirect_to domains_path
    else
      redirect_to :back
    end
  end

  def update
    @domain = Domain.find( params[:id] )
    if @domain.update_attributes(params[:domain])
      redirect_to domains_path
    else
      redirect_to :back
    end
  end

  def destroy
    if @domain.delete
      redirect_to domains_path
    else
      redirect_to :back
    end
  end


  private
    def check_user
      @domain = Domain.find(params[:id])
      unless signed_in? && current_user.id == @domain.user_id
        flash[:error] = "Action not allowed!"
        redirect_to root_path
      end
    end
end
