//CARD SET
const String TABLE_CARD_SET = "card_set";

const String COLUMN_CARD_SET_ID = "id";
const String COLUMN_CARD_SET_NAME = "name";
const String COLUMN_CARD_SET_DESCRIPTION = "description";
const String COLUMN_CARD_SET_ACTIVE = "active";
@deprecated
const String COLUMN_CARD_SET_ADMIN_TOKEN = "admin_token";
@deprecated
const String COLUMN_CARD_SET_EDITOR_TOKEN = "editor_token";
const String COLUMN_CARD_SET_WORKSHOP_ID = "workshop_id";
const String COLUMN_CARD_SET_VERSION = "version";

const List<String> allCardSetColumns = [
  COLUMN_CARD_SET_ID,
  COLUMN_CARD_SET_NAME,
  COLUMN_CARD_SET_DESCRIPTION,
  COLUMN_CARD_SET_ACTIVE,
  COLUMN_CARD_SET_WORKSHOP_ID,
  COLUMN_CARD_SET_VERSION
];

//CARD
const String TABLE_CARD = "card";

const String COLUMN_CARD_ID = "id";
const String COLUMN_CARD_CONTENT = "content";
const String COLUMN_CARD_ACTIVE = "active";
const String COLUMN_CARD_WORKSHOP_ID = "workshop_id";
const String COLUMN_CARD_CARD_SET_ID = "card_set_id";
const String COLUMN_CARD_CARD_ID = "card_id";


const List<String> allCardColumns = [
  COLUMN_CARD_ID,
  COLUMN_CARD_CONTENT,
  COLUMN_CARD_ACTIVE,
  COLUMN_CARD_WORKSHOP_ID,
  COLUMN_CARD_CARD_SET_ID,
  COLUMN_CARD_CARD_ID,
];

//USER
const String TABLE_USER = "user";

const String COLUMN_USER_ID = "id";
const String COLUMN_USER_WORKSHOP_ID = "server_id";
const String COLUMN_USER_NAME = "username";
const String COLUMN_USER_NSFW = "nsfw";

const List<String> allUserColumns = [
  COLUMN_USER_ID,
  COLUMN_USER_WORKSHOP_ID,
  COLUMN_USER_NAME,
  COLUMN_USER_NSFW
];

//USER ROLE 
const String TABLE_USER_ROLE = "user_role";

const String COLUMN_USER_ROLE_CARD_SET_ID = "card_set_id";
const String COLUMN_USER_ROLE_USER_ID = "user_id";
const String COLUMN_USER_ROLE_ROLE = "role";

const List<String> allUserRoleColumns = [
  COLUMN_USER_ROLE_CARD_SET_ID,
  COLUMN_USER_ROLE_USER_ID
];