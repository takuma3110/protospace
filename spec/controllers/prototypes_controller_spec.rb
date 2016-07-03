
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
      describe 'with invalid attribtues' do
        before do
          post :create, invalid_params
        end

        it 'does not save new prototype' do
          expect {
            post :create, invalid_params
          }.not_to change(Prototype, :count)
        end

        it 'renders the :new template when prototype dose not save' do
          expect(response).to render_template :new
        end

        it 'show flash messages of failed' do
          expect(flash[:alert]).to eq 'failed'
        end
      end
    end

    describe 'GET #show' do
      before do
        get :show, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'assigns likes associate of prototype to @likes' do
        expect(assigns(:likes)).to eq prototype.likes
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end
  end
end
