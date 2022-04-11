//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:drinkinggame_api/src/model/card_set_role.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_with_card_set_role.g.dart';

/// UserWithCardSetRole
///
/// Properties:
/// * [id] 
/// * [username] 
/// * [role] 
abstract class UserWithCardSetRole implements Built<UserWithCardSetRole, UserWithCardSetRoleBuilder> {
    @BuiltValueField(wireName: r'id')
    String? get id;

    @BuiltValueField(wireName: r'username')
    String? get username;

    @BuiltValueField(wireName: r'role')
    CardSetRole? get role;
    // enum roleEnum {  OWNER,  ADMIN,  MODERATOR,  };

    UserWithCardSetRole._();

    @BuiltValueHook(initializeBuilder: true)
    static void _defaults(UserWithCardSetRoleBuilder b) => b;

    factory UserWithCardSetRole([void updates(UserWithCardSetRoleBuilder b)]) = _$UserWithCardSetRole;

    @BuiltValueSerializer(custom: true)
    static Serializer<UserWithCardSetRole> get serializer => _$UserWithCardSetRoleSerializer();
}

class _$UserWithCardSetRoleSerializer implements StructuredSerializer<UserWithCardSetRole> {
    @override
    final Iterable<Type> types = const [UserWithCardSetRole, _$UserWithCardSetRole];

    @override
    final String wireName = r'UserWithCardSetRole';

    @override
    Iterable<Object?> serialize(Serializers serializers, UserWithCardSetRole object,
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
        if (object.role != null) {
            result
                ..add(r'role')
                ..add(serializers.serialize(object.role,
                    specifiedType: const FullType(CardSetRole)));
        }
        return result;
    }

    @override
    UserWithCardSetRole deserialize(Serializers serializers, Iterable<Object?> serialized,
        {FullType specifiedType = FullType.unspecified}) {
        final result = UserWithCardSetRoleBuilder();

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
                case r'role':
                    final valueDes = serializers.deserialize(value,
                        specifiedType: const FullType(CardSetRole)) as CardSetRole;
                    result.role = valueDes;
                    break;
            }
        }
        return result.build();
    }
}

