// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWordCollection on Isar {
  IsarCollection<Word> get words => this.collection();
}

const WordSchema = CollectionSchema(
  name: r'Word',
  id: 2997905348638732671,
  properties: {
    r'color': PropertySchema(id: 0, name: r'color', type: IsarType.long),
    r'createAt': PropertySchema(
      id: 1,
      name: r'createAt',
      type: IsarType.dateTime,
    ),
    r'example': PropertySchema(id: 2, name: r'example', type: IsarType.string),
    r'exampleWords': PropertySchema(
      id: 3,
      name: r'exampleWords',
      type: IsarType.stringList,
    ),
    r'icon': PropertySchema(id: 4, name: r'icon', type: IsarType.long),
    r'isLearned': PropertySchema(
      id: 5,
      name: r'isLearned',
      type: IsarType.bool,
    ),
    r'level': PropertySchema(
      id: 6,
      name: r'level',
      type: IsarType.byte,
      enumMap: _WordlevelEnumValueMap,
    ),
    r'meaning': PropertySchema(id: 7, name: r'meaning', type: IsarType.string),
    r'meaningWords': PropertySchema(
      id: 8,
      name: r'meaningWords',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(id: 9, name: r'name', type: IsarType.string),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.byte,
      enumMap: _WordtypeEnumValueMap,
    ),
  },

  estimateSize: _wordEstimateSize,
  serialize: _wordSerialize,
  deserialize: _wordDeserialize,
  deserializeProp: _wordDeserializeProp,
  idName: r'id',
  indexes: {
    r'createAt': IndexSchema(
      id: -3149045466074267323,
      name: r'createAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'color': IndexSchema(
      id: 880366885425937065,
      name: r'color',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'color',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'icon': IndexSchema(
      id: -5257277237617764540,
      name: r'icon',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'icon',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'isLearned': IndexSchema(
      id: 1626199868823320107,
      name: r'isLearned',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isLearned',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'type': IndexSchema(
      id: 5117122708147080838,
      name: r'type',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'type',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'level': IndexSchema(
      id: -730704511986726349,
      name: r'level',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'level',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'meaningWords': IndexSchema(
      id: -5344125982692530955,
      name: r'meaningWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'meaningWords',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'exampleWords': IndexSchema(
      id: 4230762537022106990,
      name: r'exampleWords',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'exampleWords',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _wordGetId,
  getLinks: _wordGetLinks,
  attach: _wordAttach,
  version: '3.3.2',
);

int _wordEstimateSize(
  Word object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.example.length * 3;
  bytesCount += 3 + object.exampleWords.length * 3;
  {
    for (var i = 0; i < object.exampleWords.length; i++) {
      final value = object.exampleWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.meaning.length * 3;
  bytesCount += 3 + object.meaningWords.length * 3;
  {
    for (var i = 0; i < object.meaningWords.length; i++) {
      final value = object.meaningWords[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _wordSerialize(
  Word object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.color);
  writer.writeDateTime(offsets[1], object.createAt);
  writer.writeString(offsets[2], object.example);
  writer.writeStringList(offsets[3], object.exampleWords);
  writer.writeLong(offsets[4], object.icon);
  writer.writeBool(offsets[5], object.isLearned);
  writer.writeByte(offsets[6], object.level.index);
  writer.writeString(offsets[7], object.meaning);
  writer.writeStringList(offsets[8], object.meaningWords);
  writer.writeString(offsets[9], object.name);
  writer.writeByte(offsets[10], object.type.index);
}

Word _wordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Word(
    color: reader.readLong(offsets[0]),
    example: reader.readString(offsets[2]),
    icon: reader.readLong(offsets[4]),
    isLearned: reader.readBool(offsets[5]),
    level:
        _WordlevelValueEnumMap[reader.readByteOrNull(offsets[6])] ??
        WordLevel.easy,
    meaning: reader.readString(offsets[7]),
    name: reader.readString(offsets[9]),
    type:
        _WordtypeValueEnumMap[reader.readByteOrNull(offsets[10])] ??
        WordType.article,
  );
  object.createAt = reader.readDateTime(offsets[1]);
  object.id = id;
  return object;
}

P _wordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (_WordlevelValueEnumMap[reader.readByteOrNull(offset)] ??
              WordLevel.easy)
          as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_WordtypeValueEnumMap[reader.readByteOrNull(offset)] ??
              WordType.article)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WordlevelEnumValueMap = {'easy': 0, 'medium': 1, 'hard': 2};
const _WordlevelValueEnumMap = {
  0: WordLevel.easy,
  1: WordLevel.medium,
  2: WordLevel.hard,
};
const _WordtypeEnumValueMap = {
  'article': 0,
  'pronoun': 1,
  'conjunction': 2,
  'adjective': 3,
  'preposition': 4,
  'adverb': 5,
  'verb': 6,
  'noun': 7,
};
const _WordtypeValueEnumMap = {
  0: WordType.article,
  1: WordType.pronoun,
  2: WordType.conjunction,
  3: WordType.adjective,
  4: WordType.preposition,
  5: WordType.adverb,
  6: WordType.verb,
  7: WordType.noun,
};

Id _wordGetId(Word object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _wordGetLinks(Word object) {
  return [];
}

void _wordAttach(IsarCollection<dynamic> col, Id id, Word object) {
  object.id = id;
}

extension WordQueryWhereSort on QueryBuilder<Word, Word, QWhere> {
  QueryBuilder<Word, Word, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createAt'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'color'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'icon'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isLearned'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'type'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'level'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyMeaningWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'meaningWords'),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhere> anyExampleWordsElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'exampleWords'),
      );
    });
  }
}

extension WordQueryWhere on QueryBuilder<Word, Word, QWhereClause> {
  QueryBuilder<Word, Word, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> createAtEqualTo(
    DateTime createAt,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'createAt', value: [createAt]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> createAtNotEqualTo(
    DateTime createAt,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createAt',
                lower: [],
                upper: [createAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createAt',
                lower: [createAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createAt',
                lower: [createAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'createAt',
                lower: [],
                upper: [createAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> createAtGreaterThan(
    DateTime createAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createAt',
          lower: [createAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> createAtLessThan(
    DateTime createAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createAt',
          lower: [],
          upper: [createAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> createAtBetween(
    DateTime lowerCreateAt,
    DateTime upperCreateAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'createAt',
          lower: [lowerCreateAt],
          includeLower: includeLower,
          upper: [upperCreateAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: [name]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [name],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'name',
                lower: [],
                upper: [name],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameGreaterThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [name],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameLessThan(
    String name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [],
          upper: [name],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameBetween(
    String lowerName,
    String upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [lowerName],
          includeLower: includeLower,
          upper: [upperName],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameStartsWith(
    String NamePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'name',
          lower: [NamePrefix],
          upper: ['$NamePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'name', value: ['']),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'name', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'name', upper: ['']),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> colorEqualTo(int color) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'color', value: [color]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> colorNotEqualTo(int color) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'color',
                lower: [],
                upper: [color],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'color',
                lower: [color],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'color',
                lower: [color],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'color',
                lower: [],
                upper: [color],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> colorGreaterThan(
    int color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'color',
          lower: [color],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> colorLessThan(
    int color, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'color',
          lower: [],
          upper: [color],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> colorBetween(
    int lowerColor,
    int upperColor, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'color',
          lower: [lowerColor],
          includeLower: includeLower,
          upper: [upperColor],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> iconEqualTo(int icon) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'icon', value: [icon]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> iconNotEqualTo(int icon) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'icon',
                lower: [],
                upper: [icon],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'icon',
                lower: [icon],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'icon',
                lower: [icon],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'icon',
                lower: [],
                upper: [icon],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> iconGreaterThan(
    int icon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'icon',
          lower: [icon],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> iconLessThan(
    int icon, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'icon',
          lower: [],
          upper: [icon],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> iconBetween(
    int lowerIcon,
    int upperIcon, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'icon',
          lower: [lowerIcon],
          includeLower: includeLower,
          upper: [upperIcon],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> isLearnedEqualTo(bool isLearned) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'isLearned', value: [isLearned]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> isLearnedNotEqualTo(
    bool isLearned,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isLearned',
                lower: [],
                upper: [isLearned],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isLearned',
                lower: [isLearned],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isLearned',
                lower: [isLearned],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'isLearned',
                lower: [],
                upper: [isLearned],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> typeEqualTo(WordType type) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'type', value: [type]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> typeNotEqualTo(WordType type) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [type],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'type',
                lower: [],
                upper: [type],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> typeGreaterThan(
    WordType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [type],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> typeLessThan(
    WordType type, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [],
          upper: [type],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> typeBetween(
    WordType lowerType,
    WordType upperType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'type',
          lower: [lowerType],
          includeLower: includeLower,
          upper: [upperType],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> levelEqualTo(WordLevel level) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'level', value: [level]),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> levelNotEqualTo(WordLevel level) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> levelGreaterThan(
    WordLevel level, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [level],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> levelLessThan(
    WordLevel level, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [],
          upper: [level],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> levelBetween(
    WordLevel lowerLevel,
    WordLevel upperLevel, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [lowerLevel],
          includeLower: includeLower,
          upper: [upperLevel],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementEqualTo(
    String meaningWordsElement,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'meaningWords',
          value: [meaningWordsElement],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementNotEqualTo(
    String meaningWordsElement,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'meaningWords',
                lower: [],
                upper: [meaningWordsElement],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'meaningWords',
                lower: [meaningWordsElement],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'meaningWords',
                lower: [meaningWordsElement],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'meaningWords',
                lower: [],
                upper: [meaningWordsElement],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementGreaterThan(
    String meaningWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'meaningWords',
          lower: [meaningWordsElement],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementLessThan(
    String meaningWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'meaningWords',
          lower: [],
          upper: [meaningWordsElement],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementBetween(
    String lowerMeaningWordsElement,
    String upperMeaningWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'meaningWords',
          lower: [lowerMeaningWordsElement],
          includeLower: includeLower,
          upper: [upperMeaningWordsElement],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementStartsWith(
    String MeaningWordsElementPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'meaningWords',
          lower: [MeaningWordsElementPrefix],
          upper: ['$MeaningWordsElementPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'meaningWords', value: ['']),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> meaningWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'meaningWords',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'meaningWords',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'meaningWords',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'meaningWords',
                upper: [''],
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementEqualTo(
    String exampleWordsElement,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'exampleWords',
          value: [exampleWordsElement],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementNotEqualTo(
    String exampleWordsElement,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'exampleWords',
                lower: [],
                upper: [exampleWordsElement],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'exampleWords',
                lower: [exampleWordsElement],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'exampleWords',
                lower: [exampleWordsElement],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'exampleWords',
                lower: [],
                upper: [exampleWordsElement],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementGreaterThan(
    String exampleWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'exampleWords',
          lower: [exampleWordsElement],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementLessThan(
    String exampleWordsElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'exampleWords',
          lower: [],
          upper: [exampleWordsElement],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementBetween(
    String lowerExampleWordsElement,
    String upperExampleWordsElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'exampleWords',
          lower: [lowerExampleWordsElement],
          includeLower: includeLower,
          upper: [upperExampleWordsElement],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementStartsWith(
    String ExampleWordsElementPrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'exampleWords',
          lower: [ExampleWordsElementPrefix],
          upper: ['$ExampleWordsElementPrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'exampleWords', value: ['']),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterWhereClause> exampleWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'exampleWords',
                upper: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'exampleWords',
                lower: [''],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(
                indexName: r'exampleWords',
                lower: [''],
              ),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(
                indexName: r'exampleWords',
                upper: [''],
              ),
            );
      }
    });
  }
}

extension WordQueryFilter on QueryBuilder<Word, Word, QFilterCondition> {
  QueryBuilder<Word, Word, QAfterFilterCondition> colorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'color', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> colorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'color',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> colorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'color',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> colorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'color',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createAt', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> createAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'example',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'example',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'example',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'example', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'example', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition>
  exampleWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'exampleWords',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'exampleWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'exampleWords',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'exampleWords', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition>
  exampleWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'exampleWords', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'exampleWords', length, true, length, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'exampleWords', 0, true, 0, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'exampleWords', 0, false, 999999, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'exampleWords', 0, true, length, include);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'exampleWords', length, include, 999999, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> exampleWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'exampleWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> iconEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'icon', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> iconGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'icon',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> iconLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'icon',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> iconBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'icon',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> isLearnedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isLearned', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelEqualTo(
    WordLevel value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelGreaterThan(
    WordLevel value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelLessThan(
    WordLevel value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> levelBetween(
    WordLevel lower,
    WordLevel upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'meaning',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'meaning',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'meaning',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'meaning', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'meaning', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition>
  meaningWordsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'meaningWords',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'meaningWords',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'meaningWords',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'meaningWords', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition>
  meaningWordsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'meaningWords', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meaningWords', length, true, length, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meaningWords', 0, true, 0, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meaningWords', 0, false, 999999, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meaningWords', 0, true, length, include);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'meaningWords', length, include, 999999, true);
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> meaningWordsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'meaningWords',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> typeEqualTo(WordType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: value),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> typeGreaterThan(
    WordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> typeLessThan(
    WordType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Word, Word, QAfterFilterCondition> typeBetween(
    WordType lower,
    WordType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension WordQueryObject on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQueryLinks on QueryBuilder<Word, Word, QFilterCondition> {}

extension WordQuerySortBy on QueryBuilder<Word, Word, QSortBy> {
  QueryBuilder<Word, Word, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByExample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'example', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByExampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'example', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WordQuerySortThenBy on QueryBuilder<Word, Word, QSortThenBy> {
  QueryBuilder<Word, Word, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByExample() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'example', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByExampleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'example', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByIsLearnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLearned', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByMeaning() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByMeaningDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meaning', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Word, Word, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WordQueryWhereDistinct on QueryBuilder<Word, Word, QDistinct> {
  QueryBuilder<Word, Word, QDistinct> distinctByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByExample({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'example', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByExampleWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'exampleWords');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByIsLearned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLearned');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByMeaning({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaning', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByMeaningWords() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meaningWords');
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Word, Word, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension WordQueryProperty on QueryBuilder<Word, Word, QQueryProperty> {
  QueryBuilder<Word, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Word, int, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<Word, DateTime, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> exampleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'example');
    });
  }

  QueryBuilder<Word, List<String>, QQueryOperations> exampleWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'exampleWords');
    });
  }

  QueryBuilder<Word, int, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<Word, bool, QQueryOperations> isLearnedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLearned');
    });
  }

  QueryBuilder<Word, WordLevel, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> meaningProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaning');
    });
  }

  QueryBuilder<Word, List<String>, QQueryOperations> meaningWordsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meaningWords');
    });
  }

  QueryBuilder<Word, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Word, WordType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
