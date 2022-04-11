//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:drinkinggame_api/src/model/card_dto.dart';
import 'package:drinkinggame_api/src/model/user_basic_dto.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_set_dto.g.dart';

/// CardSetDto
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [category] 
/// * [version] 
/// * [nsfw] 
/// * [creator] 
/// * [cards] 
abstract class CardSetDto implements Built<CardSetDto, CardSetDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'name')
    String? get name;

    @BuiltValueField(wireName: r'description')
    String? get description;

    @BuiltValueField(wireName: r'category')
    String? get category;

    @BuiltValueField(wireName: r'version')
    num? get version;

    @BuiltValueField(wireName: r'nsfw')
    bool? get nsfw;

    @BuiltValueField(wireName: r'creator')
    UserBasicDto? get creator;

    @BuiltValueField(wireName: r'cards')
    BuiltList<CardDto>? get cards;

    CardSetDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CardSetDtoBuilder b) => b;

    factory CardSetDto([void updates(CardSetDtoBuilder b)]) = _$CardSetDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<CardSetDto> get serializer => _$CardSetDtoSerializer();
}

class _$CardSetDtoSerializer implements StructuredSerializer<CardSetDto> {
    @override
    final Iterable<Type> types = const [CardSetDto, _$CardSetDto];

    @override
    final String wireName = r'CardSetDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, CardSetDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.name != null) {
            result
                ..add(r'name')
                ..add(serializers.serialize(object.name,
                    specifiedType: const FullType(String)));
        }
        if (object.description != null) {
            result
                ..add(r'description')
                ..add(serializers.serialize(object.description,
                    specifiedType: const FullType(String)));
        }
        if (object.category != null) {
            result
                ..add(r'category')
                ..add(serializers.serialize(object.category,
                    specifiedType: const FullType(String)));
        }
        if (object.version != null) {
            result
                ..add(r'version')
                ..add(serializers.serialize(object.version,
                    specifiedType: const FullType(num)));
        }
        if (object.nsfw != null) {
            result
                ..add(r'nsfw')
                ..add(serializers.serialize(object.nsfw,
                    specifiedType: const FullType(bool)));
        }
        if (object.creator != null) {
            result
                ..add(r'creator')
                ..add(serializers.serialize(object.creator,
                    specifiedType: const FullType(UserBasicDto)));
        }
        if (object.cards != null) {
            result
                ..add(r'cards')
                ..add(serializers.serialize(object.cards,
                    specifiedType: const FullType(BuiltList, [FullType(CardDto)])));
        }
        return result;
    }

    @override
    CardSetDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CardSetDtoBuilder();

        final iterator = serialized.iterator;
        while (iterator.moveNext()) {
            final key = iterator.current as String;
            iterator.moveNext();
            final Object? value = iterator.current;
            
            switch (key) {
                case r'id':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.id = valueDes;
                    break;
                case r'name':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.name = valueDes;
                    break;
                case r'description':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.description = valueDes;
                    break;
                case r'category':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.category = valueDes;
                    break;
                case r'version':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.version = valueDes;
                    break;
                case r'nsfw':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    result.nsfw = valueDes;
                    break;
                case r'creator':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(UserBasicDto)) as UserBasicDto;
                    result.creator.replace(valueDes);
                    break;
                case r'cards':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(BuiltList, [FullType(CardDto)])) as BuiltList<CardDto>;
                    result.cards.replace(valueDes);
                    break;
            }
        }
        return result.build();
    }
}

