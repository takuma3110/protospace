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
  end
end