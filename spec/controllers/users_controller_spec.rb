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
  end
