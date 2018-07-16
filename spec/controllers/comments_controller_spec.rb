require 'rails_helper'

describe CommentsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
  let(:product) {FactoryBot.create(:product) }
  let(:comment) { FactoryBot.create(:comment, user: user, product: product) }
  let(:invalid_comment) { FactoryBot.create(:invalid_comment, user: user, product: product) }

  describe 'POST #create' do
    context 'user is logged in' do
      before do
        sign_in user
      end

      it 'create a comment successfully' do
        post :create , params: {  :comment => FactoryBot.attributes_for(:comment),
                                  :user_id => user.id,
                                  :product_id => product.id}
        expect(flash[:notice]).to eq "Review was created successfully."
      end

      it 'create a invalid comment not successfully' do
        post :create , params: {  :comment => FactoryBot.attributes_for(:invalid_comment),
                                  :user_id => user.id,
                                  :product_id => product.id}
        expect(flash[:alert]).to eq "Review was not created successfully."
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'normal user is logged in' do
      before do
        sign_in user
      end

      it 'cannot delete a comment' do
        delete :destroy, params: {product_id: product.id, id: comment.id }
        expect(flash[:alert]).to eq "Admins only!"
      end

    end

    context 'admin is logged in' do
      before do
        sign_in admin
      end

      it 'can delete a comment' do
        delete :destroy, params: { product_id: product.id, id: comment.id }
        expect(flash[:notice]).to eq "Comment has been destroyed"
      end
    end
  end
end
