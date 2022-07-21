class CreateDoctorSpeciality < ActiveRecord::Migration[6.1]
  def change
    create_table :doctor_specialities do |t|
      t.string :name
    end
  end
end
