require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create :user }
  context 'when valid' do
    it { expect(user).to be_valid }
  end
  context 'when phone number' do
    context 'is too short' do
      before { user.phone = '1' }
      it { expect(user).to_not be_valid }

      it 'returns proper error' do
        user.valid?
        expect(user.errors.full_messages).to include('Phone is too short (minimum is 10 characters)')
      end
    end

    context 'is too short' do
      before { user.phone = '1' * 20 }
      it { expect(user).to_not be_valid }

      it 'returns proper error' do
        user.valid?
        expect(user.errors.full_messages).to include('Phone is too long (maximum is 15 characters)')
      end
    end

    context 'contains chars' do
      before { user.phone = Faker::String.random(length: 11) }
      it { expect(user).to_not be_valid }

      it 'returns proper error' do
        user.valid?
        expect(user.errors.full_messages).to include('Phone is not a number')
      end
    end

    context 'is nil' do
      before { user.phone = nil }
      it { expect(user).to_not be_valid }

      it 'returns proper error' do
        user.valid?
        expect(user.errors.full_messages).to include('Phone is not a number')
      end
    end

    context 'is not unique' do
      before { user.phone = '0123456789' }
      it { expect(user).to_not be_valid }

      it 'returns proper error' do
        user.valid?
        expect(user.errors.full_messages).to include('Phone has already been taken')
      end
    end
  end
end
