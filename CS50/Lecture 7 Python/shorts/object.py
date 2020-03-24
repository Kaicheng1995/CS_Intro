#1 define a new object call "Student"
class Student():

    # self is needed to recall the object, __init__ means initial function.
    def __init__(self, name, id):
        self.name = name
        self.id = id

    # change id when need to
    def changeID(self, id):
        self.id = id

    # print out
    def print(self):
        print("{} - {}".format(self.name, self.id))


#2 creating a new object called jane.(initialization)
jane = Student("Jane", 10)
jane.print()

#3 change a new id
jane.changeID(11)
jane.print()