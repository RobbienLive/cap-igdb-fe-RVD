namespace studentApp;

entity Students {
  key ID: UUID;
  studentID: String(50) @assert.unique @mandatory;
  firstName: String(50);
  lastName: String(50);
  email: String(100);
  age: Integer;
  FavoriteGames: Association to many Games on FavoriteGames.students = $self;
}

entity Games {
  key ID: UUID;
  gameID: String(50) @assert.unique @mandatory;
  title: String(100);
  genre: String(50);
  releaseDate: Date;
  studentID: String(50);
  students: Association to Students;
}
