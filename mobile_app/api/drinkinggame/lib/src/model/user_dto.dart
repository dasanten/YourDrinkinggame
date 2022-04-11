//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:drinkinggame_api/src/model/user_role.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_dto.g.dart';

/// UserDto
///
/// Properties:
/// * [id] 
/// * [username] 
/// * [eMail] 
/// * [role] 
abstract class UserDto implements Built<UserDto, UserDtoBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'username')
    String? get username;

    @BuiltValueField(wireName: r'e-mail')
    String? get eMail;

    @BuiltValueField(wireName: r'role')
    UserRole? get role;
    // enum roleEnum {  SUPER_ADMIN,  ADMIN,  MODERATOR,  HELPER,  USER,  };

    UserDto._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UserDtoBuilder b) => b;

    factory UserDto([void updates(UserDtoBuilder b)]) = _$UserDto;

    @BuiltValueSerializer(custom: true)
    static Serializer<UserDto> get serializer => _$UserDtoSerializer();
}

class _$UserDtoSerializer implements StructuredSerializer<UserDto> {
    @override
    final Iterable<Type> types = const [UserDto, _$UserDto];

    @override
    final String wireName = r'UserDto';

    @override
    Iterable<Object?> serialize(Serializers serializers, UserDto object,
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
        if (object.eMail != null) {
            result
                ..add(r'e-mail')
                ..add(serializers.serialize(object.eMail,
                    specifiedType: const FullType(String)));
        }
        if (object.role != null) {
            result
                ..add(r'role')
                ..add(serializers.serialize(object.role,
                    specifiedType: const FullType(UserRole)));
        }
        return result;
    }

    @override
    UserDto deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserDtoBuilder();

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
                case r'e-mail':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(String)) as String;
                    result.eMail = valueDes;
                    break;
                case r'role':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(UserRole)) as UserRole;
                    result.role = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

