# frozen_string_literal: true
class CreateBusinessHours < ActiveRecord::Migration[5.2]
  def change
    create_table :business_hours do |t|
      t.integer :date
      t.time :start_at
      t.time :end_at

      t.timestamps
    end
  end
end
