#include <stdio.h>

#include "uuid.h"

int main() {
	uuid_t uu;
	uuid_string_t str;
	uuid_generate(uu);
	uuid_unparse_upper(uu, str);
	printf("%s\n", str);
}
