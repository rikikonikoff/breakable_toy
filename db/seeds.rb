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

a1 = Appointment.create(date: Date.today+17 , start_time: Time.parse("2:00pm"),
  end_time: Time.parse("3:00pm"), provider: p1, user: u1, booked?: true)
