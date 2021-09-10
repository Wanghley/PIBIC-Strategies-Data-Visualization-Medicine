class Patient:
    def __init__(self, name, birthday, sex, parkinsonian):
        self.name = name
        self.birthday = birthday
        self.sex = sex
        self.parkinsonian = parkinsonian
    def toString(self):
        return self.name+", "+self.birthday+", "+self.sex+", parkinsonian? "+str(self.parkinsonian)
