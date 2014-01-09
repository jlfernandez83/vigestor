class PaginasController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  
  def destroy
    Pagina.find(params[:id]).destroy
    flash[:success] = "Página borrada."
    redirect_to paginas_url
  end
  def new
    @pagina = Pagina.new
    @content_field = @pagina.content_fields.build
  end
  def create
    @pagina = Pagina.new(pagina_params)

    #De momento el tipo queda establecido a "prototipo inicial"
    @pagina.tipo = "prototipo inicial"

    @content_field = @pagina.content_fields.build(content_field_params)
    if(@pagina.save)
      
      flash[:success] = "La página se ha creado con éxito!"
      if(@content_field.save)
        flash[:success] = "La página y sus contenidos se han creado con éxito"
        
        redirect_to action: "index"
      else
      #Aquí entra si se crea la página pero no el contenido
      flash[:warning] = "Hubo problemas al crear el contenido"
      #Hay que borrar la página
      @pagina.destroy
      redirect_to :new_pagina
      end
    else
      #Aquí entra si no se crea la página
      flash[:warning] = "Hubo problemas al crear la página"
      redirect_to :new_pagina
    end
  end
 
  def index
     @paginas = Pagina.paginate(page: params[:page], per_page: 10)
  end
  def show
    @pagina = Pagina.find(params[:id])
    @content_fields = @pagina.content_fields
    case @pagina.tipo 
      
      when "prototipo inicial" 
        render layout: "vitutor_template_prov"
    end
  end
  def edit
    @pagina = Pagina.find(params[:id])
    @content_field = @pagina.content_fields.first
  end
  def update
    @pagina = Pagina.find(params[:id])
    @content_field = @pagina.content_fields.first
    if @pagina.update_attributes(pagina_params)
      flash[:success] = "Contenido de página actualizado"
      if @content_field.update_attributes(content_field_params)
        flash[:success] = "Página y campos de contenidos actualizados"
        redirect_to action: "index"
      else
        render 'edit'
      end
    else
      render 'edit'
    end
    #flash[:success] = "Se ejecuta el update"
    #render inline: "<% params.each do |p| %><p><%= p %></p><% end %>"
  end

  private
    def pagina_params
      params.require(:pagina).permit(:url)
    end
    def content_field_params
      params.require(:content_field).permit(:contenido, :title)
    end
end
