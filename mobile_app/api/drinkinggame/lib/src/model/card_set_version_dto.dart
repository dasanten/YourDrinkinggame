//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_set_version_dto.g.dart';

/// CardSetVersionDto
///
/// Properties:
/// * [id] 
/// * [version] 
abstract class CardSetVersionDto implements Built<CardSetVersionDto, CardSetVersionDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'version')
    num? get version;

    CardSetVersionDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CardSetVersionDtoBuilder b) => b;

    factory CardSetVersionDto([void updates(CardSetVersionDtoBuilder b)]) = _$CardSetVersionDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<CardSetVersionDto> get serializer => _$CardSetVersionDtoSerializer();
}

class _$CardSetVersionDtoSerializer implements StructuredSerializer<CardSetVersionDto> {
    @override
    final Iterable<Type> types = const [CardSetVersionDto, _$CardSetVersionDto];

    @override
    final String wireName = r'CardSetVersionDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, CardSetVersionDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.version != null) {
            result
                ..add(r'version')
                ..add(serializers.serialize(object.version,
                    specifiedType: const FullType(num)));
        }
        return result;
    }

    @override
    CardSetVersionDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CardSetVersionDtoBuilder();

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
                case r'version':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(num)) as num;
                    result.version = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

