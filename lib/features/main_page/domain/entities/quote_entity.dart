import 'package:test_case/core/core.dart';

class QuoteEntity {
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final int length;
  final List<String> tags;

  QuoteEntity({
    required this.id,
    required this.content,
    required this.author,
    required this.authorSlug,
    required this.length,
    required this.tags,
  });


  factory QuoteEntity.fromJson(JType map) {
    return QuoteEntity(
      id: map['_id'] as String,
      content: map['content'] as String,
      author: map['author'] as String,
      authorSlug: map['authorSlug'] as String,
      length: map['length'] as int,
      tags: (map['tags'] as List)
          .map(
            (e) => e as String,
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'content': content,
        'author': author,
        'authorSlug': authorSlug,
        'length': length,
        'tags': tags,
      };

  @override
  String toString() {
    return 'QuoteEntity'
        '{'
        'id: $id, '
        'content: $content, '
        'author: $author, '
        'authorSlug: $authorSlug, '
        'length: $length, '
        'tags: $tags'
        '}';
  }
}
