p1 = Provider.create(name: "Example Psychiatrist", email: "psychiatrist@example.com",
  work_address: "123 Example St", city: "Minneapolis", state: "Minnesota", zip: "55426",
  profile: "www.example.com/me", remote_avatar_url: "http://www.minddisorders.com/photos/psychiatrist-1019.jpg",
  uid: "123", bio: "I got my MD from Johns Hopkins and specialize in adolescent mood disorders.")
p2 = Provider.create(name: "Example Social Worker", email: "socialworker@example.com",
  work_address: "30 Sesame St", city: "Albany", state: "NY", zip: "12201",
  remote_avatar_url: "http://www.bestsocialworkprograms.com/wp-content/uploads/2014/06/Clinical-Social-Worker.jpg",
  uid: "456", bio: "I am an LICSW with a passion for helping people!")
p3 = Provider.create(name: "Example Psychologist", email: "psychphd@example.com",
  work_address: "1570 42nd St", city: "New York", state: "New York", zip: "10036",
  remote_avatar_url: "http://www.allpsychologyschools.com/wp-content/uploads/2016/06/forensic-psychology-job-description.jpg",
  uid: "789", bio: "I got my PhD in Clinical Psychology from Washington University in St. Louis.")
p4 = Provider.create(name: "Erwin Schrodinger", email: "isthecatalive@itsunclear.com",
  uid: "1011", remote_avatar_url: "http://www.chemistryexplained.com/images/chfa_04_img0825.jpg")
p5 = Provider.create(name: "Dr. Sigmund Freud", email: "superego@id.com",
  uid: "1213", remote_avatar_url: "http://www.sigmundfreud.net/images/sigmund-freud.jpg")
p6 = Provider.create(name: "B. F. Skinner", email: "operant.conditioning@behavior.com",
  uid: "1415", remote_avatar_url: "https://www.biography.com/.image/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTE5NTU2MzE2MzcxNTg0NTIz/bf-skinner-9485671-1-402.jpg")
p7 = Provider.create(name: "Ivan Pavlov", email: "classical.conditioning@bells.com", remote_avatar_url: "http://www.notablebiographies.com/images/uewb_08_img0547.jpg",
  uid: "1617")
p8 = Provider.create(name: "Anna Freud", email: "childpsychology@example.com",
  remote_avatar_url: "https://s-media-cache-ak0.pinimg.com/736x/b9/c5/99/b9c599248c98523ac0ec5fcc5637852e.jpg", uid: "1819")
p9 = Provider.create(name: "Jean Piaget", email: "cognitivedevelopment@example.com",
  remote_avatar_url: "https://upload.wikimedia.org/wikipedia/commons/6/67/Jean_Piaget_in_Ann_Arbor.png", uid: "2021")

u1 = User.create(name: "Joe Smith", email: "joe.smith@example.com", uid: "9876")
u2 = User.create(name: "Michelle Gold", email: "michelle.gold@example.com", uid: "8765")
u3 = User.create(name: "Dinny Segev", email: "dinny.segev@example.com", uid: "7654")
u4 = User.create(name: "Ava Johnson", email: "ava.johnson@example.com", uid: "6543")

a1 = Appointment.create(date: Date.today+17, start_time: Time.parse("2:00pm"),
  end_time: Time.parse("3:00pm"), provider: p1, user: u1, booked?: true)
a2 = Appointment.create(date: Date.today+20, start_time: Time.parse("8:00am"),
  end_time: Time.parse("8:30am"), provider: p2, user: u1, booked?: true)
a3 = Appointment.create(date: Date.today+32, start_time: Time.parse("11:00am"),
  end_time: Time.parse("12:00pm"), provider: p1, user: u2, booked?: true)
a4 = Appointment.create(date: Date.today+8, start_time: Time.parse("9:30am"),
  end_time: Time.parse("10:15am"), provider: p1, user: u4, booked?: true)
a5 = Appointment.create(date: Date.today+40, start_time: Time.parse("1:00pm"),
  end_time: Time.parse("2:00pm"), provider: p8, user: u3, booked?: true)
a6 = Appointment.create(date: Date.today+18, start_time: Time.parse("2:15pm"),
  end_time: Time.parse("3:45pm"), provider: p3, user: u3, booked?: true)
a7 = Appointment.create(date: Date.today+6, start_time: Time.parse("7:30am"),
  end_time: Time.parse("8:00am"), provider: p4, booked?: false)
a8 = Appointment.create(date: Date.today+9, start_time: Time.parse("9:00am"),
  end_time: Time.parse("10:00am"), provider: p1, booked?: false)
a9 = Appointment.create(date: Date.today+19, start_time: Time.parse("10:00am"),
  end_time: Time.parse("11:00am"), provider: p2, booked?: false)
a10 = Appointment.create(date: Date.today+20, start_time: Time.parse("2:00pm"),
  end_time: ("3:00pm"), provider: p3, booked?: false)


i1 = Insurer.create(company: "United Healthcare", plan: "Choice Plus")
i2 = Insurer.create(company: "United Healthcare", plan: "Options PPO")
i3 = Insurer.create(company: "Medicare", plan: "CarePlus")
i4 = Insurer.create(company: "Tufts", plan: "Health Direct")
i6 = Insurer.create(company: "Aetna", plan: "4")
i7 = Insurer.create(company: "State Farm", plan: "8")
i8 = Insurer.create(company: "Centicare", plan: "7")
i9 = Insurer.create(company: "Anthem", plan: "9")
i10 = Insurer.create(company: "Blue Cross BlueShield", plan: "2")

InsuranceProvider.create(insurer: i1, provider: p1)
InsuranceProvider.create(insurer: i1, provider: p3)
InsuranceProvider.create(insurer: i2, provider: p2)
InsuranceProvider.create(insurer: i3, provider: p2)
InsuranceProvider.create(insurer: i4, provider: p2)
InsuranceProvider.create(insurer: i4, provider: p4)
InsuranceProvider.create(insurer: i6, provider: p5)
InsuranceProvider.create(insurer: i6, provider: p6)
InsuranceProvider.create(insurer: i7, provider: p8)
InsuranceProvider.create(insurer: i8, provider: p7)
InsuranceProvider.create(insurer: i9, provider: p6)
InsuranceProvider.create(insurer: i10, provider: p8)
