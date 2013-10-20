require 'spec_helper'

describe TopicsController do
  describe "GET #index" do
    context 'not authenticated' do
      it "redirect" do
        get :index
        expect(response).to be_redirect
      end
    end
    context 'authenticated' do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end
      it 'should render' do
        get :index
        expect(response).to be_success
      end
    end
  end

end
