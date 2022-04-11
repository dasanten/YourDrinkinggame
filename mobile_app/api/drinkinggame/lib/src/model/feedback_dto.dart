//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'feedback_dto.g.dart';

/// FeedbackDto
///
/// Properties:
/// * [id] 
/// * [header] 
/// * [description] 
/// * [answerAddress] 
abstract class FeedbackDto implements Built<FeedbackDto, FeedbackDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'header')
    String? get header;

    @BuiltValueField(wireName: r'description')
    String? get description;

    @BuiltValueField(wireName: r'answerAddress')
    String? get answerAddress;

    FeedbackDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(FeedbackDtoBuilder b) => b;

    factory FeedbackDto([void updates(FeedbackDtoBuilder b)]) = _$FeedbackDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<FeedbackDto> get serializer => _$FeedbackDtoSerializer();
}

class _$FeedbackDtoSerializer implements StructuredSerializer<FeedbackDto> {
    @override
    final Iterable<Type> types = const [FeedbackDto, _$FeedbackDto];

    @override
    final String wireName = r'FeedbackDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, FeedbackDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.header != null) {
            result
                ..add(r'header')
                ..add(serializers.serialize(object.header,
                    specifiedType: const FullType(String)));
        }
        if (object.description != null) {
            result
                ..add(r'description')
                ..add(serializers.serialize(object.description,
                    specifiedType: const FullType(String)));
        }
        if (object.answerAddress != null) {
            result
                ..add(r'answerAddress')
                ..add(serializers.serialize(object.answerAddress,
                    specifiedType: const FullType(String)));
        }
        return result;
    }

    @override
    FeedbackDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = FeedbackDtoBuilder();

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
                case r'header':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.header = valueDes;
                    break;
                case r'description':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.description = valueDes;
                    break;
                case r'answerAddress':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.answerAddress = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

