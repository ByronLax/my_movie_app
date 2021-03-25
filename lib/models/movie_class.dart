class MovieClass {
  final int id;
  final String title;
  final String imageURL;
  final String description;
  final double rating;
  final String poster;

  MovieClass({
    this.id,
    this.title,
    this.description,
    this.imageURL,
    this.rating,
    this.poster,
  });
}

class MovieCasts {
  final String name;
  final String profileImageUrl;
  final String characterName;
  MovieCasts({
    this.name,
    this.profileImageUrl,
    this.characterName,
  });
}

class ReviewsClass {
  final String author;
  final String authorImage;
  final String reviewContent;
  ReviewsClass({
    this.author,
    this.authorImage,
    this.reviewContent,
  });
}
