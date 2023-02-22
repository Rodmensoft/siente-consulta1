class DropDownCard {
  DropDownCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.isOpen,
  });
  String icon;
  String title;
  String content;
  bool isOpen = false;

  static List<DropDownCard> listDropDownCards = <DropDownCard>[
    DropDownCard(
      icon: 'assets/new/details/cost.png',
      title: '¿Cuanto cuesta?',
      content: '',
      isOpen: false,
    ),
      DropDownCard(
      icon: 'assets/new/details/progress.png',
      title: '¿Cómo va el proyecto?',
      content: '',
      isOpen: false,
    ),
      DropDownCard(
      icon: 'assets/new/details/participants.png',
      title: '¿Quienes participan?',
      content: '',
      isOpen: false,
    ),
      DropDownCard(
      icon: 'assets/new/details/images.png',
      title: 'Imágenes',
      content: '',
      isOpen: false,
    ),
      DropDownCard(
      icon: 'assets/new/details/attached.png',
      title: 'Datos relevantes',
      content: '',
      isOpen: false, 
    ),
    //   DropDownCard(
    //   icon: 'assets/new/details/opinions.png',
    //   title: 'Opiniones',
    //   content: '',
    //   isOpen: false,
    // ),
  ];
}
