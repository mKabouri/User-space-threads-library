#include <stdio.h>
#include <assert.h>
#include "thread.h"

thread_t th1, th2;
signal_t sig1, sig2;
int signal_id1, signal_id2;


static void *thfunc1(void *arg) {
  int signal_id = *(int *)arg;

  printf("Thread %p en attente du signal %d\n", thread_self(), signal_id);
  thread_sigwait(signal_id);
  printf("Thread %p reçu le signal %d\n", thread_self(), signal_id);

  printf("Envoi du signal 2...\n");
  signal_send(&sig2, th2);
  return NULL;
}

static void *thfunc2(void *arg) {
  int signal_id = *(int *)arg;

  printf("Envoi du signal 1...\n");
  signal_send(&sig1, th1);

  printf("Thread %p en attente du signal %d\n", thread_self(), signal_id);
  thread_sigwait(signal_id);
  printf("Thread %p reçu le signal %d\n", thread_self(), signal_id);

  return NULL;
}

int main() {
  
  int err;

  signal_init(&sig1, 1);
  signal_init(&sig2, 2);

  int signal_id1 = 1;
  int signal_id2 = 2;

  err = thread_create(&th1, thfunc1, &signal_id1);
  assert(!err);
  err = thread_create(&th2, thfunc2, &signal_id2);
  assert(!err);

  thread_yield();
  thread_join(th1, NULL);
  thread_join(th2, NULL);

  return 0;
}
