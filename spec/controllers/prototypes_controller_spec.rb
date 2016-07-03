
require 'rails_helper'

describe PrototypesController do
   let!(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'sample')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil)
   }}

  describe 'with user login' do
    before { login_user }
    describe 'GET #index' do
      before do
        get :index
      end

      it 'assigns the requested prototypes to @prototypes' do
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
        get :new
      end

      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      describe 'with valid attribtues' do
        before do
          post :create, params
        end

        it 'save new prototype' do
          expect {
            post :create, params
          }.to change(Prototype, :count).by(1)
        end

        it 'redirect to root' do
          expect(response).to redirect_to root_path
        end

        it 'show flash message of success' do
          expect(flash[:success]).to eq 'success'
        end
      end
    end
  end
end
