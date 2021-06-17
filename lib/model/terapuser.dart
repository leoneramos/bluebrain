class TerapUser {
  String id;
  String name;
  String discription;
  String role;
  String imageUrl;

  TerapUser({this.name, this.role, this.discription, this.imageUrl, this.id});
}

var terapusers = [
  TerapUser(
      id: '0',
      name: 'Fulana de Tal',
      discription: 'Cuido de crianças a mais de 20 anos.',
      role: 'Terapeuta',
      imageUrl: 'imagens/terapeuta_m.png'),
  TerapUser(
      id: '1',
      name: 'Fulano de Tal',
      discription: 'Cuido de crianças a mais de 20 anos.',
      role: 'Terapeuta',
      imageUrl: 'imagens/terapeuta_f.png'),
  TerapUser(
      id: '0',
      name: 'Fulana de Tal',
      discription: 'Cuido de crianças a mais de 20 anos.',
      role: 'Terapeuta',
      imageUrl: 'imagens/terapeuta_m.png'),
  TerapUser(
      id: '1',
      name: 'Fulano de Tal',
      discription: 'Cuido de crianças a mais de 20 anos.',
      role: 'Terapeuta',
      imageUrl: 'imagens/terapeuta_f.png'),
];
