String getRating(int rating) {
  String stars = '';

  for (int i = 0; i < rating; i++) {
    stars += '⭐';
  }
  stars.trim();

  return stars;
}
