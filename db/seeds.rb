# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
r1 = Role.create({ name: 'Patient' })
r2 = Role.create({ name: 'Doctor' })

d1 = DoctorSpeciality.create({ name: 'Dentist' })

p1 = Profile.create({ first_name: 'Ben', last_name: 'Doe' })
p2 = Profile.create({ first_name: 'John', last_name: 'Mayer', doctor_speciality_id: d1.id })

u1 = User.create({ phone: '0123456789', password: 'password', role_id: r1.id, profile_id: p1.id })
u2 = User.create({ phone: '0987654321', password: 'password', role_id: r2.id, profile_id: p2.id })

Appointment.create({ doctor_id: u2.id, patient_id: u1.id, status: 'Active' })

AdminUser.create!(phone: '0000000000', password: 'password',
                  password_confirmation: 'password')
