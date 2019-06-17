require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { Transaction.new}

  describe "基本功能：狀態" do
    it 'Default state = pending' do
      expect(transaction.state).to eq 'pending'
    end

    it 'After accept, the transaction state will change to waiting_pick_up' do
      transaction.accept
      expect(transaction.state).to eq 'waiting_pick_up'
    end
    
    it '訂單產生時加入流水編號' do
      t1 = FactoryBot.create(:transaction)
      ans = "%08d" % t1.id
      expect(t1.serial_number).to eq ans
      # expect(t1.serial_number).to be true
    end
  end
end
