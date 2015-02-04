require 'rails_helper'

RSpec.describe 'Getting a project', type: :request do
  let(:user) {FactoryGirl.create(:user_with_company)}
  
  context 'that a user is authorized for' do
    context 'with a company with a valid subscription' do
      it 'returns a 200' do
        get "/api/projects/#{project.id}", {
          'X-Auth-Token' => token.string,
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
        }
        
        expect(response.status).to eq(200)
        expect(response.content_type).to eq(Mime::JSON)
      end
    end 
  end
end