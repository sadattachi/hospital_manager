class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: {to_table: :users}
      t.references :patient, foreign_key: {to_table: :users}
      t.string :status
      t.text :recommendations
      t.timestamps
    end
  end
end
