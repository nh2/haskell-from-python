#include <stdlib.h>

#include "HsFFI.h"

void
example_init (void)
{
  hs_init (NULL, NULL);
}

void
example_exit (void)
{
  hs_exit ();
}
