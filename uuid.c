#include <string.h>

#include "uuid.h"

/* Shadows uuid_generate(3) from CoreFramework. */
void uuid_generate(uuid_t out) {
	memset(out, 0xAA, sizeof (uuid_t));
}
