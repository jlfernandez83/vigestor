require 'spec_helper'

describe "Pagina pages" do
  
  subject { page }
  
  describe "index" do

    let(:pagina) { FactoryGirl.create(:pagina) }
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit paginas_path
    end

    it { should have_title('Todas las páginas') }
    it { should have_content('Todas las páginas') }

    describe "pagination" do

      before(:all) { 50.times { FactoryGirl.create(:pagina) } }
      after(:all)  { Pagina.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each pagina" do
        Pagina.paginate(page: 1, per_page: 10).each do |pagina|
          expect(page).to have_selector('li', text: pagina.url)
        end
      end
    end

  end
end
