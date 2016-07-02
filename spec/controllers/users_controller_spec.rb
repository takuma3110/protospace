require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:params) {{
    id: user.id,
    user: attributes_for(:user, name: 'sample')
  }}

  describe 'with user login' do
    before { login_user }

    describe 'GET #show' do
      before :each do
        get :show, id: user
      end

      it 'assigns the requested to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
        before :each do
        get :edit, id: user
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
        patch :update, params
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'changes @users attribtues' do
        user.reload
        expect(user.name).to eq 'sample'
      end

      it 'redirects user path' do
        expect(response).to redirect_to user_path
      end

      it 'sends flash messages' do
        expect(flash[:success]).to eq 'Your data was successfully updated'
      end
    end
  end

  describe 'without user login' do
    describe 'GET #edit' do
      it 'redirects sign_in page'do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
