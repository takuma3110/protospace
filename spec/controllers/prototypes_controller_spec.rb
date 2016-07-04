
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

    describe 'GET #edit' do
      before do
        get :edit, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns main_image to @main' do
        expect(assigns(:main_image)).to eq prototype.main_image
      end

      it 'assigns sub_images to @sub' do
        expect(assigns(:sub_images)).to eq prototype.set_sub_img
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end


    describe 'PATCH #update' do
      describe 'with valid attributes' do
        before do
          patch :update, params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end


        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.title).to eq 'sample'
        end

        it 'redirects to root_path'  do
          expect(response).to redirect_to root_path(prototype)
        end

        it 'shows flash message of updating' do
          expect(flash[:success]).to eq 'updating is successful'
        end
      end

      describe 'with invalid attributes' do
        before do
          patch :update, invalid_params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'does not save the new prototype' do
          prototype.reload
          expect(prototype.title).not_to eq 'sample'
        end

        it 'renders the :show template' do
          expect(response).to render_template :edit
        end

        it 'show flash message to show update prototype unsuccessfully' do
          expect(flash[:alert]).to eq "failed"
        end
      end
    end
  end
end
