serialized_person = File.read('input/serialization/person.dat')
Marshal.load(serialized_person)
