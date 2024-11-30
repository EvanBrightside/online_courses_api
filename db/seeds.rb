author1 = Author.create(name: 'Author 1')
author2 = Author.create(name: 'Author 2')

p 'Authors created'

course1 = Course.create(title: 'Course 1', description: 'Description 1', author: author1)
course2 = Course.create(title: 'Course 2', description: 'Description 2', author: author2)

p 'Courses created'

competency1 = Competency.create(name: 'Competency 1')
competency2 = Competency.create(name: 'Competency 2')

p 'Competencies created'

course1.competencies << competency1
course2.competencies << competency2
