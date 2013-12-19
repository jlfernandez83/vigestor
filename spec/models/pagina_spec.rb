require 'spec_helper'

describe Pagina do
  before { @pagina = Pagina.new(tipo: "Prototipo inicial", contenido: "Un contenido posible",url: "vitutor.com/ruta" ) }

  subject { @pagina }

  it { should respond_to(:tipo) }
  it { should respond_to(:contenido) }
  it { should respond_to(:url) }
  
  pending "Comprobar formato url"

  pending "Utilizar escapado para almacenar HTML en DB. (see http://stackoverflow.com/questions/6488701/should-you-can-you-store-html-erb-code-in-a-database )"

  it { should be_valid }

  describe "when contenido is not present" do
    before { @pagina.contenido = " " }
    it { should_not be_valid }
  end
  describe "when tipo is not present" do
    before { @pagina.tipo = " " }
    it { should_not be_valid }
  end

  describe "when url is not present" do
    before { @pagina.url = " " }
    it { should_not be_valid }
  end
  

  describe "when url is already taken" do
    before do
      pagina_with_same_url = @pagina.dup
      pagina_with_same_url.url = @pagina.url.upcase
      pagina_with_same_url.save
    end
    it { should_not be_valid }
  end
end
