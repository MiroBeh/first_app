require 'rails_helper'

describe ProductsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
  let(:product) { FactoryBot.create(:product) }

  describe 'Access to ProductsController pages' do
    context 'nobody is logged in' do
      it 'loads correct product site' do
        get :show, params: { id: product.id }
        expect(response).to be_ok
        expect(assigns(:product)).to eq product
      end

      it 'cannot access to new page' do
        get :new
        expect(response).to redirect_to(root_path)
      end

      it 'cannot access to edit page' do
        get :edit, params: { id: product.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'normal user is logged in' do
      before do
        sign_in user
      end

      it 'cannot access to new page' do
        get :new
        expect(response).to redirect_to(root_path)
      end

      it 'cannot access to edit page' do
        get :edit, params: { id: product.id }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'admin is logged in' do
      before do
        sign_in admin
      end

      it 'can access to new page' do
        get :new
        expect(response).to be_ok
        expect(response).to render_template('new')
      end

      it 'can access to edit page' do
        get :edit, params: { id: product.id }
        expect(response).to be_ok
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'nobody is logged in' do
      it 'cannot delete a product' do
        delete :destroy, params: { id: product.id }
        expect(flash[:alert]).to eq "Admins only!"
      end
    end

    context 'normal user is logged in' do
      before do
        sign_in user
      end

      it 'cannot delete a product' do
        delete :destroy, params: { id: product.id }
        expect(flash[:alert]).to eq "Admins only!"
      end
    end

    context 'admin is logged in' do
      before do
        sign_in admin
      end

      it 'can delete a product' do
        delete :destroy, params: { id: product.id }
        expect(flash[:notice]).to eq "Product was successfully destroyed."
      end
    end
  end
end
