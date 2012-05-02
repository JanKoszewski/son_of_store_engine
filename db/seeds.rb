u1 = User.create(
  :name => 'Matt Yoho',
  :email => 'demo10+matt@jumpstartlab.com',
  :password => 'hungry'
)

u2 = User.create(
  :name => 'Jeff',
  :email => 'demo10+jeff@jumpstartlab.com',
  :password => 'hungry',
  :username => 'j3'
)

User.create(
  :name => 'Chad Fowler',
  :email => 'demo10+chad@jumpstartlab.com',
  :password => 'hungry',
  :username => 'SaxPlayer'
).add_role(Role.super_admin)
