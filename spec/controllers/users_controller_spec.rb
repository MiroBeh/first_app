require 'rails_helper'

describe UsersController, type: :controller do

  #let(:user) { User.create!(email: "test@web.de", password: "testpassword")}
  let(:user) { FactoryBot.create(:user)}
  #let(:user2) { User.create!(email: "test2@web.de", password: "testpassword2")}
  let(:user2) { FactoryBot.create(:user)}

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end

      it 'cannot access to other users page' do
        get :show, params: { id: user2.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status(302)
      end
    end
  end
end
