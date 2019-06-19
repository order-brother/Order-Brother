require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction_base) { Transaction.new }
  let(:transaction) { FactoryBot.create(:transaction) }
  let(:s1) { FactoryBot.create(:store, :super_store) }
  let(:d1) { FactoryBot.create(:dish) }
  let(:d2) { FactoryBot.create(:dish) }

  describe '基本功能：狀態' do
    it 'Default state = pending' do
      expect(transaction_base.state).to eq 'pending'
    end

    it 'After accept, the transaction state will change to waiting_pick_up' do
      transaction_base.accept
      expect(transaction_base.state).to eq 'waiting_pick_up'
    end

    it '訂單產生時加入流水編號' do
      t1 = FactoryBot.create(:transaction)
      ans = '%08d' % t1.id
      expect(t1.serial_number).to eq ans
    end
  end

  describe '後台：建立訂單' do
    it '根據參數建立 transaction_item' do
      transaction.store = s1
      transaction.description = return_order[:description]
      transaction.description = return_order[:pick_up_time]
      return_order[:transaction_item].each do |_index, col|
        t = transaction.transaction_items.new(col)
        t.save!
      end
      expect(transaction.save!).to be true
      expect(transaction.total_price).to eq 600
    end
  end

  private

  def return_order
    {
      :description => 'text_here',
      :pick_up_time => 'Wed, 19 Jun 2019 21:17:38 CST +08:00>',
      :transaction_item => {
        :item1 => {
          'dish_id' => d1.id,
          'dish_count' => 1,
          'item_price' => 400
        },
        :item2 => {
          'dish_id' => d2.id,
          'dish_count' => 1,
          'item_price' => 200
        }
      }
    }
  end
end
