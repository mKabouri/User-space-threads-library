CC = gcc
CFLAGS = -Wall -Isrc -std=c99 -g

.PHONY: all build clean

SRC_DIR = src
TST_DIR = test
INSTALL_DIR = install

SRCS = ${SRC_DIR}/*.c
EXAMPLE_OBJ = example.o
MAIN_OBJ = 01-main.o
SWITCH_OBJ = 02-switch.o
EQUITY_OBJ = 03-equity.o
JOIN_OBJ = 11-join.o
JOIN-MAIN_OBJ = 12-join-main.o
CREATE-MANY = 21-create-many.o
CREATE-MANY-RECURSIVE = 22-create-many-recursive.o
CREATE-MANY-ONCE = 23-create-many-once.o
SWITCH_MANY = 31-switch-many.o
SWITCH_MANY_JOIN = 32-switch-many-join.o
SWITCH_MANY_CASCADE = 33-switch-many-cascade.o
FIBONACCI = 51-fibonacci.o
MUTEX = 61-mutex.o
MUTEX_2 = 62-mutex.o
MUTEX_2 = 62-mutex.o
MUTEX_3 = 63-mutex-equity.o
PREEMPTION = 71-preemption.o
DEADLOCK = 81-deadlock.o
SIGNAL = signal_test.o

EXAMPLE_OBJ_p = example_p.o
MAIN_OBJ_p = 01-main_p.o
SWITCH_OBJ_p = 02-switch_p.o
EQUITY_OBJ_p = 03-equity_p.o
JOIN_OBJ_p = 11-join_p.o
JOIN-MAIN_OBJ_p = 12-join-main_p.o
CREATE-MANY_p = 21-create-many_p.o
CREATE-MANY-RECURSIVE_p = 22-create-many-recursive_p.o
CREATE-MANY-ONCE_p = 23-create-many-once_p.o
SWITCH_MANY_p = 31-switch-many_p.o
SWITCH_MANY_JOIN_p = 32-switch-many-join_p.o
SWITCH_MANY_CASCADE_p = 33-switch-many-cascade_p.o
FIBONACCI_p = 51-fibonacci_p.o
MUTEX_p = 61-mutex_p.o
MUTEX_2_p = 62-mutex_p.o
MUTEX_2_p = 62-mutex_p.o
MUTEX_3_p = 63-mutex-equity_p.o
PREEMPTION_p = 71-preemption_p.o
DEADLOCK_p = 81-deadlock_p.o

all: build

build: example ${MAIN_OBJ} ${MAIN_OBJ_p} ${SWITCH_OBJ} ${EQUITY_OBJ} ${JOIN_OBJ} ${JOIN-MAIN_OBJ} ${CREATE-MANY} ${CREATE-MANY-RECURSIVE} ${CREATE-MANY-ONCE} ${SWITCH_MANY} ${SWITCH_MANY_JOIN} ${SWITCH_MANY_CASCADE} ${FIBONACCI} ${MUTEX} ${MUTEX_2} ${PREEMPTION} ${DEADLOCK} ${SIGNAL} ${MUTEX_3} ${SWITCH_OBJ_p} ${EQUITY_OBJ_p} ${JOIN_OBJ_p} ${JOIN-MAIN_OBJ_p} ${CREATE-MANY_p} ${CREATE-MANY-RECURSIVE_p} ${CREATE-MANY-ONCE_p} ${SWITCH_MANY_p} ${SWITCH_MANY_JOIN_p} ${SWITCH_MANY_CASCADE_p} ${FIBONACCI_p} ${MUTEX_p} ${MUTEX_2_p} ${PREEMPTION_p} ${DEADLOCK_p} ${} ${MUTEX_3_p} install

%.o: ${SRC_DIR}/%.c
	${CC} ${CFLAGS} -fPIC -c $< -o $@

%.o: ${TST_DIR}/%.c
	${CC} ${CFLAGS} -fPIC -c $< -o $@

%_p.o: ${TST_DIR}/%.c
	${CC} ${CFLAGS} -fPIC -DUSE_PTHREAD -c $< -o $@

example: thread.o ${EXAMPLE_OBJ}
	${CC} ${CFLAGS} $^ -o $@

install: thread.o 
	mkdir ${INSTALL_DIR}
	mkdir ${INSTALL_DIR}/bin
	mkdir ${INSTALL_DIR}/bin_pthread
	${CC} -shared $^ -o ${INSTALL_DIR}/libthread.so
	${CC} ${CFLAGS} ${MAIN_OBJ} thread.o -o ${INSTALL_DIR}/bin/01-main
	${CC} ${CFLAGS} ${SWITCH_OBJ} thread.o -o ${INSTALL_DIR}/bin/02-switch
	${CC} ${CFLAGS} ${EQUITY_OBJ} thread.o -o ${INSTALL_DIR}/bin/03-equity
	${CC} ${CFLAGS} ${JOIN_OBJ} thread.o -o ${INSTALL_DIR}/bin/11-join
	${CC} ${CFLAGS} ${JOIN-MAIN_OBJ} thread.o -o ${INSTALL_DIR}/bin/12-join-main
	${CC} ${CFLAGS} ${CREATE-MANY} thread.o -o ${INSTALL_DIR}/bin/21-create-many
	${CC} ${CFLAGS} ${CREATE-MANY-RECURSIVE} thread.o -o ${INSTALL_DIR}/bin/22-create-many-recursive
	${CC} ${CFLAGS} ${CREATE-MANY-ONCE} thread.o -o ${INSTALL_DIR}/bin/23-create-many-once
	${CC} ${CFLAGS} ${SWITCH_MANY} thread.o -o ${INSTALL_DIR}/bin/31-switch-many
	${CC} ${CFLAGS} ${SWITCH_MANY_JOIN} thread.o -o ${INSTALL_DIR}/bin/32-switch-many-join
	${CC} ${CFLAGS} ${SWITCH_MANY_CASCADE} thread.o -o ${INSTALL_DIR}/bin/33-switch-many-cascade
	${CC} ${CFLAGS} ${FIBONACCI} thread.o -o ${INSTALL_DIR}/bin/51-fibonacci
	${CC} ${CFLAGS} ${MUTEX} thread.o -o ${INSTALL_DIR}/bin/61-mutex
	${CC} ${CFLAGS} ${MUTEX_2} thread.o -o ${INSTALL_DIR}/bin/62-mutex
	${CC} ${CFLAGS} ${MUTEX_3} thread.o -o ${INSTALL_DIR}/bin/63-mutex
	${CC} ${CFLAGS} ${PREEMPTION} thread.o -o ${INSTALL_DIR}/bin/71-preemption
	${CC} ${CFLAGS} ${DEADLOCK} thread.o -o ${INSTALL_DIR}/bin/81-deadlock

	${CC} ${CFLAGS} ${SIGNAL} thread.o -o ${INSTALL_DIR}/bin/signal_test

	${CC} ${CFLAGS}  ${MAIN_OBJ_p} thread.o -o ${INSTALL_DIR}/bin_pthread/01-main
	${CC} ${CFLAGS}  ${SWITCH_OBJ_p} thread.o -o ${INSTALL_DIR}/bin_pthread/02-switch
	${CC} ${CFLAGS}  ${EQUITY_OBJ_p} thread.o -o ${INSTALL_DIR}/bin_pthread/03-equity
	${CC} ${CFLAGS}  ${JOIN_OBJ_p} thread.o -o ${INSTALL_DIR}/bin_pthread/11-join
	${CC} ${CFLAGS}  ${JOIN-MAIN_OBJ_p} thread.o -o ${INSTALL_DIR}/bin_pthread/12-join-main
	${CC} ${CFLAGS}  ${CREATE-MANY_p} thread.o -o ${INSTALL_DIR}/bin_pthread/21-create-many
	${CC} ${CFLAGS}  ${CREATE-MANY-RECURSIVE_p} thread.o -o ${INSTALL_DIR}/bin_pthread/22-create-many-recursive
	${CC} ${CFLAGS}  ${CREATE-MANY-ONCE_p} thread.o -o ${INSTALL_DIR}/bin_pthread/23-create-many-once
	${CC} ${CFLAGS}  ${SWITCH_MANY_p} thread.o -o ${INSTALL_DIR}/bin_pthread/31-switch-many
	${CC} ${CFLAGS}  ${SWITCH_MANY_JOIN_p} thread.o -o ${INSTALL_DIR}/bin_pthread/32-switch-many-join
	${CC} ${CFLAGS}  ${SWITCH_MANY_CASCADE_p} thread.o -o ${INSTALL_DIR}/bin_pthread/33-switch-many-cascade
	${CC} ${CFLAGS}  ${FIBONACCI_p} thread.o -o ${INSTALL_DIR}/bin_pthread/51-fibonacci
	${CC} ${CFLAGS}  ${MUTEX_p} thread.o -o ${INSTALL_DIR}/bin_pthread/61-mutex
	${CC} ${CFLAGS}  ${MUTEX_2_p} thread.o -o ${INSTALL_DIR}/bin_pthread/62-mutex
	${CC} ${CFLAGS}  ${MUTEX_3_p} thread.o -o ${INSTALL_DIR}/bin_pthread/63-mutex
	${CC} ${CFLAGS}  ${PREEMPTION_p} thread.o -o ${INSTALL_DIR}/bin_pthread/71-preemption
	${CC} ${CFLAGS}  ${DEADLOCK_p} thread.o -o ${INSTALL_DIR}/bin_pthread/81-deadlock

clean:
	rm -f *.o example ${MAIN_OBJ} ${SWITCH_OBJ} ${EQUITY_OBJ} ${JOIN_OBJ} ${JOIN-MAIN_OBJ} ${CREATE-MANY} ${CREATE-MANY-RECURSIVE} ${CREATE-MANY-ONCE} ${SWITCH_MANY} ${SWITCH_MANY_JOIN} ${SWITCH_MANY_CASCADE} ${FIBONACCI} ${MUTEX} ${MUTEX_2} ${MUTEX_3} ${PREEMPTION} ${DEADLOCK} ${MAIN_OBJ_p} ${SWITCH_OBJ_p} ${EQUITY_OBJ_p} ${JOIN_OBJ_p} ${JOIN-MAIN_OBJ_p} ${CREATE-MANY_p} ${CREATE-MANY-RECURSIVE_p} ${CREATE-MANY-ONCE_p} ${SWITCH_MANY_p} ${SWITCH_MANY_JOIN_p} ${SWITCH_MANY_CASCADE_p} ${FIBONACCI_p} ${MUTEX_p} ${MUTEX_2_p} ${PREEMPTION_p} ${DEADLOCK_p} ${MUTEX_3_p}
	rm -rf install
