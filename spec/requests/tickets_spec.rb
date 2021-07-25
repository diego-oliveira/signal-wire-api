require "rails_helper"

RSpec.describe "Tickets", :type => :request do
  describe 'POST /api/v1/tickets' do
    describe 'when all mandatory attributes are given' do
      before do
        post api_v1_tickets_path, params: { title: 'xpto', user_id: 1234 }
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:created)
      end

      it 'creates a ticket' do
        expect(Ticket.count).to be 1
      end
    end

    describe 'when missing mandatory attributes' do
      before do
        post api_v1_tickets_path, params: { title: '' }
      end

      it 'returns 422 error' do
        expect(response).to have_http_status(422)
      end

      it 'returns the errors' do
        response_json = JSON.parse(response.body)
        expect(response_json['message']).to match(/Validation failed: Title can't be blank, User can't be blank/)
      end
    end
  end

end
