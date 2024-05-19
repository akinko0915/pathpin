class Folder {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int placeId;

  Folder({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.placeId,
  });
}

class Place {
  final int id;
  final String name;
  final String address;
  final String imageUrl;
  final String memo;
  final String createdAt;
  final String updatedAt;
  final int userId;

  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.memo,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });
}

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });
}

final List<Folder> dummyFolders = [
  Folder(
    id: 1,
    name: 'Hoge',
    createdAt: '2024-05-15',
    updatedAt: '2024-05-20',
    placeId: 1,
  ),
  Folder(
    id: 2,
    name: 'Fuga',
    createdAt: '2024-05-14',
    updatedAt: '2024-05-28',
    placeId: 3,
  ),
];

final List<Place> dummyPlaces = [
  Place(
    id: 1,
    name: '神戸',
    address: '670-0012 兵庫県神戸市',
    imageUrl: 'https://example.com',
    memo: '楽しかった！',
    createdAt: '2024-05-17',
    updatedAt: '2024-09-12',
    userId: 1,
  ),
  Place(
    id: 2,
    name: '北海道',
    address: '',
    imageUrl: 'https://example.com/contents',
    memo: '楽しかった！',
    createdAt: '2024-05-27',
    updatedAt: '2024-09-02',
    userId: 2,
  ),
];

final List<User> dummyUsers = [
  User(
    id: 1,
    name: 'John Doe',
    email: 'john@example.com',
    password: 'password123',
    createdAt: '2024-05-01',
    updatedAt: '2024-05-01',
  ),
  User(
    id: 2,
    name: 'Jane Smith',
    email: 'jane@example.com',
    password: 'password456',
    createdAt: '2024-05-02',
    updatedAt: '2024-05-02',
  ),
];