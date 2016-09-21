SUBDIRS = argon2
CFLAGS += -I./argon2/include
LIBS += -lmysqlclient -largon2 -L./argon2 -largon2

all: apxs
apxs: subdirs
	apxs -c ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} ${LIBS} mod_auth_mysql.c

subdirs:
	for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

.PHONY: subdirs clean
