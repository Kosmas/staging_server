class ServersController < ApplicationController
  before_action :set_server, only: [:edit, :update]

  def index
    @servers = Server.all
  end

  def edit
  end

  def update
    @server.update(server_params)
    redirect_to servers_path
  end

  private

  def server_params
    params.require(:server).permit(:issue, :programmer, :status)
  end
  
  def set_server
    @server = Server.find(params[:id])
  end
end
