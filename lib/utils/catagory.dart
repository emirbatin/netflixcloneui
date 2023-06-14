class Category {
  final String title;
  final List<String> images;

  Category(this.title, this.images);
}

List<Category> categories = [
  Category(
    'Listem',
    [
      'assets/series/listem/breakingbad.jpg',
      'assets/series/listem/wotakoi.jpg',
      'assets/series/listem/wayne.jpg',
      'assets/series/listem/violetevergarden.jpg',
    ],
  ),
  Category(
    'Animeler',
    [
      'assets/series/animeler/violetevergarden.jpg',
      'assets/series/animeler/onepiece.jpg',
      'assets/series/animeler/rezero.jpg',
      'assets/series/animeler/asilentvoice.jpg',
      'assets/series/listem/wotakoi.jpg',
    ],
  ),
  Category(
    'Gerçek Hayattan Uyarlananlar Filmler',
    [
      'assets/series/gercek_hayattan_esinlenen/baticephesi.jpg',
      'assets/series/gercek_hayattan_esinlenen/narvik.webp',
    ],
  ),
];
