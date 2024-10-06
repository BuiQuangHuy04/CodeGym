class Res {
  List<Data>? data;
  List<Included>? included;
  Links? links;
  Meta? meta;

  Res({this.data, this.included, this.links, this.meta});

  Res.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    if (json['included'] != null) {
      included = <Included>[];
      json['included'].forEach((v) {
        included!.add(Included.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (included != null) {
      data['included'] = included!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Res{data: $data, included: $included, links: $links, meta: $meta}';
  }
}

class Data {
  String? id;
  String? type;
  Attributes? attributes;
  Relationships? relationships;
  Links? links;

  Data({this.id, this.type, this.attributes, this.relationships, this.links});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
    relationships = json['relationships'] != null
        ? Relationships.fromJson(json['relationships'])
        : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    if (relationships != null) {
      data['relationships'] = relationships!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{id: $id, type: $type, attributes: $attributes, relationships: $relationships, links: $links}';
  }
}

class Attributes {
  String? uri;
  String? name;
  String? description;
  String? releasedAt;
  bool? free;
  String? difficulty;
  String? contentType;
  int? duration;
  double? popularity;
  String? technologyTripleString;
  String? contributorString;
  int? ordinal;
  bool? professional;
  String? descriptionPlainText;
  String? videoIdentifier;
  String? parentName;
  bool? accessible;
  String? cardArtworkUrl;
  String? slug;
  String? level;

  Attributes({
    this.uri,
    this.name,
    this.description,
    this.releasedAt,
    this.free,
    this.difficulty,
    this.contentType,
    this.duration,
    this.popularity,
    this.technologyTripleString,
    this.contributorString,
    this.ordinal,
    this.professional,
    this.descriptionPlainText,
    this.videoIdentifier,
    this.parentName,
    this.accessible,
    this.cardArtworkUrl,
    this.slug,
    this.level,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    name = json['name'] ?? '';
    description = json['description'];
    releasedAt = json['released_at'];
    free = json['free'];
    difficulty = json['difficulty'];
    contentType = json['content_type'];
    duration = json['duration'];
    popularity = json['popularity'];
    technologyTripleString = json['technology_triple_string'];
    contributorString = json['contributor_string'];
    ordinal = json['ordinal'] ?? 0;
    professional = json['professional'];
    descriptionPlainText = json['description_plain_text'];
    videoIdentifier = json['video_identifier'] ?? '';
    parentName = json['parent_name'] ?? '';
    accessible = json['accessible'];
    cardArtworkUrl = json['card_artwork_url'];
    slug = json['slug'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uri'] = uri;
    data['name'] = name;
    data['description'] = description;
    data['released_at'] = releasedAt;
    data['free'] = free;
    data['difficulty'] = difficulty;
    data['content_type'] = contentType;
    data['duration'] = duration;
    data['popularity'] = popularity;
    data['technology_triple_string'] = technologyTripleString;
    data['contributor_string'] = contributorString;
    data['ordinal'] = ordinal;
    data['professional'] = professional;
    data['description_plain_text'] = descriptionPlainText;
    data['video_identifier'] = videoIdentifier;
    data['parent_name'] = parentName;
    data['accessible'] = accessible;
    data['card_artwork_url'] = cardArtworkUrl;
    data['slug'] = slug;
    data['level'] = level;
    return data;
  }

  @override
  String toString() {
    return 'Attributes{uri: $uri, name: $name, description: $description, releasedAt: $releasedAt, free: $free, difficulty: $difficulty, contentType: $contentType, duration: $duration, popularity: $popularity, technologyTripleString: $technologyTripleString, contributorString: $contributorString, ordinal: $ordinal, professional: $professional, descriptionPlainText: $descriptionPlainText, videoIdentifier: $videoIdentifier, parentName: $parentName, accessible: $accessible, cardArtworkUrl: $cardArtworkUrl, slug: $slug, level: $level}';
  }
}

class Relationships {
  Domains? domains;
  ChildContents? childContents;
  Progression? progression;
  Progression? bookmark;

  Relationships(
      {this.domains, this.childContents, this.progression, this.bookmark});

  Relationships.fromJson(Map<String, dynamic> json) {
    domains =
        json['domains'] != null ? Domains.fromJson(json['domains']) : null;
    childContents = json['child_contents'] != null
        ? ChildContents.fromJson(json['child_contents'])
        : null;
    progression = json['progression'] != null
        ? Progression.fromJson(json['progression'])
        : null;
    bookmark = json['bookmark'] != null
        ? Progression.fromJson(json['bookmark'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (domains != null) {
      data['domains'] = domains!.toJson();
    }
    if (childContents != null) {
      data['child_contents'] = childContents!.toJson();
    }
    if (progression != null) {
      data['progression'] = progression!.toJson();
    }
    if (bookmark != null) {
      data['bookmark'] = bookmark!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Relationships{domains: $domains, childContents: $childContents, progression: $progression, bookmark: $bookmark}';
  }
}

class Domains {
  List<Data>? data;

  Domains({this.data});

  Domains.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Domains{data: $data}';
  }
}

class ChildContents {
  Meta? meta;

  ChildContents({this.meta});

  ChildContents.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'ChildContents{meta: $meta}';
  }
}

class Meta {
  int? count;
  int? totalResultCount;

  Meta({
    this.count,
    this.totalResultCount,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    totalResultCount = json['total_result_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['total_result_count'] = totalResultCount;
    return data;
  }

  @override
  String toString() {
    return 'Meta{count: $count, totalResultCount: $totalResultCount}';
  }
}

class Progression {
  String? data;

  Progression({this.data});

  Progression.fromJson(Map<String, dynamic> json) {
    data = json['data'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }

  @override
  String toString() {
    return 'Progression{data: $data}';
  }
}

class Included {
  String? id;
  String? type;
  Attributes? attributes;

  Included({this.id, this.type, this.attributes});

  Included.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Included{id: $id, type: $type, attributes: $attributes}';
  }
}

class Links {
  String? self;
  String? first;
  String? prev;
  String? next;
  String? last;

  Links({this.self, this.first, this.prev, this.next, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] ?? '';
    first = json['first'] ?? '';
    prev = json['prev'] ?? '';
    next = json['next'] ?? '';
    last = json['last'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['first'] = first;
    data['prev'] = prev;
    data['next'] = next;
    data['last'] = last;
    return data;
  }

  @override
  String toString() {
    return 'Links{self: $self, first: $first, prev: $prev, next: $next, last: $last}';
  }
}
