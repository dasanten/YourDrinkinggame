//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_basic_dto.g.dart';

/// UserBasicDto
///
/// Properties:
/// * [id] 
/// * [username] 
abstract class UserBasicDto implements Built<UserBasicDto, UserBasicDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'username')
    String? get username;

    UserBasicDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UserBasicDtoBuilder b) => b;

    factory UserBasicDto([void updates(UserBasicDtoBuilder b)]) = _$UserBasicDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<UserBasicDto> get serializer => _$UserBasicDtoSerializer();
}

class _$UserBasicDtoSerializer implements StructuredSerializer<UserBasicDto> {
    @override
    final Iterable<Type> types = const [UserBasicDto, _$UserBasicDto];

    @override
    final String wireName = r'UserBasicDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, UserBasicDto object,
        {FullType specifiedType = FullType.unspecified}) {
        final result = <Object?>[];
        if (object.id != null) {
            result
                ..add(r'id')
                ..add(serializers.serialize(object.id,
                    specifiedType: const FullType(String)));
        }
        if (object.username != null) {
            result
                ..add(r'username')
                ..add(serializers.serialize(object.username,
                    specifiedType: const FullType(String)));
        }
        return result;
    }

    @override
    UserBasicDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserBasicDtoBuilder();

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
                case r'username':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.username = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

