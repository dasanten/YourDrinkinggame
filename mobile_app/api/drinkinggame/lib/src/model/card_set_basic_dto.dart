//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_set_basic_dto.g.dart';

/// CardSetBasicDto
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [category] 
/// * [nsfw] 
abstract class CardSetBasicDto implements Built<CardSetBasicDto, CardSetBasicDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'name')
    String? get name;

    @BuiltValueField(wireName: r'description')
    String? get description;

    @BuiltValueField(wireName: r'category')
    String? get category;

    @BuiltValueField(wireName: r'nsfw')
    bool? get nsfw;

    CardSetBasicDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CardSetBasicDtoBuilder b) => b;

    factory CardSetBasicDto([void updates(CardSetBasicDtoBuilder b)]) = _$CardSetBasicDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<CardSetBasicDto> get serializer => _$CardSetBasicDtoSerializer();
}

class _$CardSetBasicDtoSerializer implements StructuredSerializer<CardSetBasicDto> {
    @override
    final Iterable<Type> types = const [CardSetBasicDto, _$CardSetBasicDto];

    @override
    final String wireName = r'CardSetBasicDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, CardSetBasicDto object,
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
        if (object.nsfw != null) {
            result
                ..add(r'nsfw')
                ..add(serializers.serialize(object.nsfw,
                    specifiedType: const FullType(bool)));
        }
        return result;
    }

    @override
    CardSetBasicDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CardSetBasicDtoBuilder();

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
                case r'nsfw':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(bool)) as bool;
                    result.nsfw = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

