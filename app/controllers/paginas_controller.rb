class PaginasController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  def new
  end
  def index
     @paginas = Pagina.paginate(page: params[:page], per_page: 10)
  end
  def show
    @pagina = Pagina.find(params[:id])
    case @pagina.tipo 
      
      when "prototipo inicial" 
        render layout: "vitutor_template_prov"
    end
  end
  def edit
    @pagina = Pagina.find(params[:id])
  end
end
