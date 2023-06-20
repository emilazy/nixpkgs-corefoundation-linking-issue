/* These match the definitions in <uuid/uuid.h>. */

typedef unsigned char uuid_t[16];
typedef char uuid_string_t[37];

void uuid_generate(uuid_t out);
void uuid_unparse_upper(uuid_t uu, uuid_string_t out);
