//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:drinkinggame_api/src/model/card_type.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_dto.g.dart';

/// CardDto
///
/// Properties:
/// * [id] 
/// * [content] 
/// * [card] 
/// * [type] 
abstract class CardDto implements Built<CardDto, CardDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'content')
    String? get content;

    @BuiltValueField(wireName: r'card')
    CardDto? get card;

    @BuiltValueField(wireName: r'type')
    CardType? get type;
    // enum typeEnum {  STANDARD,  LATER,  NEXT,  CLEAR,  GAME,  };

    CardDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(CardDtoBuilder b) => b;

    factory CardDto([void updates(CardDtoBuilder b)]) = _$CardDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<CardDto> get serializer => _$CardDtoSerializer();
}

class _$CardDtoSerializer implements StructuredSerializer<CardDto> {
    @override
    final Iterable<Type> types = const [CardDto, _$CardDto];

    @override
    final String wireName = r'CardDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, CardDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.content != null) {
            result
                ..add(r'content')
                ..add(serializers.serialize(object.content,
                    specifiedType: const FullType(String)));
        }
        if (object.card != null) {
            result
                ..add(r'card')
                ..add(serializers.serialize(object.card,
                    specifiedType: const FullType(CardDto)));
        }
        if (object.type != null) {
            result
                ..add(r'type')
                ..add(serializers.serialize(object.type,
                    specifiedType: const FullType(CardType)));
        }
        return result;
    }

    @override
    CardDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = CardDtoBuilder();

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
                case r'content':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.content = valueDes;
                    break;
                case r'card':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(CardDto)) as CardDto;
                    result.card.replace(valueDes);
                    break;
                case r'type':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(CardType)) as CardType;
                    result.type = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

