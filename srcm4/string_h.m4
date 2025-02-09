# string_h.m4
# serial 39
dnl Copyright (C) 2007-2024 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.
dnl This file is offered as-is, without any warranty.

# Configure a GNU-like replacement for <string.h>.

# Written by Paul Eggert.

AC_DEFUN_ONCE([gl_STRING_H],
[
  dnl Ensure to expand the default settings once only, before all statements
  dnl that occur in other macros.
  AC_REQUIRE([gl_STRING_H_DEFAULTS])
  gl_NEXT_HEADERS([string.h])

  dnl Check for declarations of anything we want to poison if the
  dnl corresponding gnulib module is not in use, and which is not
  dnl guaranteed by C89.
  gl_WARN_ON_USE_PREPARE([[#include <string.h>
    ]],
    [explicit_bzero ffsl ffsll memmem mempcpy memrchr memset_explicit
     rawmemchr stpcpy stpncpy strchrnul
     strdup strncat strndup strnlen strpbrk strsep strcasestr strtok_r
     strerror_r strerrorname_np sigabbrev_np sigdescr_np strsignal strverscmp])

  AC_REQUIRE([AC_C_RESTRICT])
])

# gl_STRING_MODULE_INDICATOR([modulename])
# sets the shell variable that indicates the presence of the given module
# to a C preprocessor expression that will evaluate to 1.
# This macro invocation must not occur in macros that are AC_REQUIREd.
AC_DEFUN([gl_STRING_MODULE_INDICATOR],
[
  dnl Ensure to expand the default settings once only.
  gl_STRING_H_REQUIRE_DEFAULTS
  gl_MODULE_INDICATOR_SET_VARIABLE([$1])
  dnl Define it also as a C macro, for the benefit of the unit tests.
  gl_MODULE_INDICATOR_FOR_TESTS([$1])
])

# Initializes the default values for AC_SUBSTed shell variables.
# This macro must not be AC_REQUIREd.  It must only be invoked, and only
# outside of macros or in macros that are not AC_REQUIREd.
AC_DEFUN([gl_STRING_H_REQUIRE_DEFAULTS],
[
  m4_defun(GL_MODULE_INDICATOR_PREFIX[_STRING_H_MODULE_INDICATOR_DEFAULTS], [
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_EXPLICIT_BZERO])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FFSL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_FFSLL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MEMCHR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MEMMEM])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MEMPCPY])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MEMRCHR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MEMSET_EXPLICIT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_RAWMEMCHR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STPCPY])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STPNCPY])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRCHRNUL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRDUP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRNCAT])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRNDUP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRNLEN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRPBRK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRSEP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRSTR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRCASESTR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRTOK_R])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSLEN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSNLEN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSCHR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSRCHR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSSTR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSCASECMP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSNCASECMP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSPCASECMP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSCASESTR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSCSPN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSPBRK])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSSPN])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSSEP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MBSTOK_R])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRERROR])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRERROR_R])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRERRORNAME_NP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SIGABBREV_NP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_SIGDESCR_NP])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRSIGNAL])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_STRVERSCMP])
    dnl Support Microsoft deprecated alias function names by default.
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_MEMCCPY], [1])
    gl_MODULE_INDICATOR_INIT_VARIABLE([GNULIB_MDA_STRDUP], [1])
  ])
  m4_require(GL_MODULE_INDICATOR_PREFIX[_STRING_H_MODULE_INDICATOR_DEFAULTS])
  dnl Make sure the shell variable for GNULIB_FREE_POSIX is initialized.
  gl_STDLIB_H_REQUIRE_DEFAULTS
  AC_REQUIRE([gl_STRING_H_DEFAULTS])
])

AC_DEFUN([gl_STRING_H_DEFAULTS],
[
  HAVE_MBSLEN=0;             AC_SUBST([HAVE_MBSLEN])
  dnl Assume proper GNU behavior unless another module says otherwise.
  HAVE_EXPLICIT_BZERO=1;        AC_SUBST([HAVE_EXPLICIT_BZERO])
  HAVE_FFSL=1;                  AC_SUBST([HAVE_FFSL])
  HAVE_FFSLL=1;                 AC_SUBST([HAVE_FFSLL])
  HAVE_DECL_MEMMEM=1;           AC_SUBST([HAVE_DECL_MEMMEM])
  HAVE_MEMPCPY=1;               AC_SUBST([HAVE_MEMPCPY])
  HAVE_MEMSET_EXPLICIT=1;       AC_SUBST([HAVE_MEMSET_EXPLICIT])
  HAVE_DECL_MEMRCHR=1;          AC_SUBST([HAVE_DECL_MEMRCHR])
  HAVE_RAWMEMCHR=1;             AC_SUBST([HAVE_RAWMEMCHR])
  HAVE_STPCPY=1;                AC_SUBST([HAVE_STPCPY])
  HAVE_STPNCPY=1;               AC_SUBST([HAVE_STPNCPY])
  HAVE_STRCHRNUL=1;             AC_SUBST([HAVE_STRCHRNUL])
  HAVE_DECL_STRDUP=1;           AC_SUBST([HAVE_DECL_STRDUP])
  HAVE_DECL_STRNDUP=1;          AC_SUBST([HAVE_DECL_STRNDUP])
  HAVE_DECL_STRNLEN=1;          AC_SUBST([HAVE_DECL_STRNLEN])
  HAVE_STRPBRK=1;               AC_SUBST([HAVE_STRPBRK])
  HAVE_STRSEP=1;                AC_SUBST([HAVE_STRSEP])
  HAVE_STRCASESTR=1;            AC_SUBST([HAVE_STRCASESTR])
  HAVE_DECL_STRTOK_R=1;         AC_SUBST([HAVE_DECL_STRTOK_R])
  HAVE_DECL_STRERROR_R=1;       AC_SUBST([HAVE_DECL_STRERROR_R])
  HAVE_STRERRORNAME_NP=1;       AC_SUBST([HAVE_STRERRORNAME_NP])
  HAVE_SIGABBREV_NP=1;          AC_SUBST([HAVE_SIGABBREV_NP])
  HAVE_SIGDESCR_NP=1;           AC_SUBST([HAVE_SIGDESCR_NP])
  HAVE_DECL_STRSIGNAL=1;        AC_SUBST([HAVE_DECL_STRSIGNAL])
  HAVE_STRVERSCMP=1;            AC_SUBST([HAVE_STRVERSCMP])
  REPLACE_FFSLL=0;              AC_SUBST([REPLACE_FFSLL])
  REPLACE_MEMCHR=0;             AC_SUBST([REPLACE_MEMCHR])
  REPLACE_MEMMEM=0;             AC_SUBST([REPLACE_MEMMEM])
  REPLACE_MEMPCPY=0;            AC_SUBST([REPLACE_MEMPCPY])
  REPLACE_MEMSET_EXPLICIT=0;    AC_SUBST([REPLACE_MEMSET_EXPLICIT])
  REPLACE_STPCPY=0;             AC_SUBST([REPLACE_STPCPY])
  REPLACE_STPNCPY=0;            AC_SUBST([REPLACE_STPNCPY])
  REPLACE_STRCHRNUL=0;          AC_SUBST([REPLACE_STRCHRNUL])
  REPLACE_STRDUP=0;             AC_SUBST([REPLACE_STRDUP])
  REPLACE_STRNCAT=0;            AC_SUBST([REPLACE_STRNCAT])
  REPLACE_STRNDUP=0;            AC_SUBST([REPLACE_STRNDUP])
  REPLACE_STRNLEN=0;            AC_SUBST([REPLACE_STRNLEN])
  REPLACE_STRSTR=0;             AC_SUBST([REPLACE_STRSTR])
  REPLACE_STRCASESTR=0;         AC_SUBST([REPLACE_STRCASESTR])
  REPLACE_STRTOK_R=0;           AC_SUBST([REPLACE_STRTOK_R])
  REPLACE_STRERROR=0;           AC_SUBST([REPLACE_STRERROR])
  REPLACE_STRERROR_R=0;         AC_SUBST([REPLACE_STRERROR_R])
  REPLACE_STRERRORNAME_NP=0;    AC_SUBST([REPLACE_STRERRORNAME_NP])
  REPLACE_STRSIGNAL=0;          AC_SUBST([REPLACE_STRSIGNAL])
  REPLACE_STRVERSCMP=0;         AC_SUBST([REPLACE_STRVERSCMP])
  UNDEFINE_STRTOK_R=0;          AC_SUBST([UNDEFINE_STRTOK_R])
])
