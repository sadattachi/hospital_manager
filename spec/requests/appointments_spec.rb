require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'POST /appointments/:id' do
    before do
      sign_in User.first
    end

    context 'when valid request' do
      before { post '/appointments/2' }

      it { expect(response).to redirect_to(appointments_path) }
      it { expect { post '/appointments/2' }.to(change { Appointment.count }.by(1)) }
    end

    context 'when invalid request' do
      before { 11.times { post '/appointments/2' } }

      it { expect(response).to redirect_to(root_path) }
    end
  end
end
