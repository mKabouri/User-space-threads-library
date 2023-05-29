#include "thread.h"
#include <stdio.h>
#include <assert.h>



static void * threadfunc(void * arg)
{
  char *name = arg;
  printf("je suis le thread %p, lancé avec l'argument %s\n",
	 (void*) thread_self(), name);
  thread_yield();
  printf("je suis encore le thread %p, lancé avec l'argument %s\n",
	 (void*) thread_self(), name);

  //int i = makeID();
  //printf("#### thread %d ####\n", i);

  thread_exit(arg);
}

int main(int argc, char *argv[])
{
  //init_thread();

  thread_t thread1, thread2, thread3;
  //void *retval1, *retval2;
  int err;

  printf("le main lance 3 threads...\n");
  err = thread_create(&thread1, threadfunc, "thread1");
  assert(!err);
  err = thread_create(&thread2, threadfunc, "thread2");
  assert(!err);
  err = thread_create(&thread3, threadfunc, "thread3");
  assert(!err);
  printf("le main a lancé les threads %p et %p\n",
	 (void*) thread1, (void*) thread2);

  printf("toto 1 ############\n");

  thread_yield();

  printf("toto 2 ############\n");

  thread_yield();

  printf("toto 3 ############\n");

/*
  printf("le main attend les threads\n");
  err = thread_join(thread2, &retval2);
  assert(!err);
  err = thread_join(thread1, &retval1);
  assert(!err);
  printf("les threads ont terminé en renvoyant '%s' and '%s'\n",
	 (char *) retval1, (char *) retval2);
*/
  return 0;
}
