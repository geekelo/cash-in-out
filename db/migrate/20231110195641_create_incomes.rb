class CreateIncomes < ActiveRecord::Migration[7.1]
  def change
    create_table :incomes do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
