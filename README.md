# Example custom stdenv error

This repository shows a simple `shell.nix` that attempts to create a custom
environment with "fortify" hardening disabled. However, some issues exists.

```bash
$ gcc
/nix/store/...-binutils-2.38/bin/ld: /nix/store/...-glibc-2.34-210/lib/crt1.o: in function `_start':
/build/glibc-2.34/csu/../sysdeps/x86_64/start.S:104: undefined reference to `main'
collect2: error: ld returned 1 exit status
```

```bash
$ strace -f -e trace=execve gcc test.c
execve("/nix/store/...-gcc-11.3.0/bin/gcc", ["/nix/store/...-gcc-11.3.0/bin/gcc", ..., "-D_FORTIFY_SOURCE=2", ..., "test.c", ...], ...) = 0
```
