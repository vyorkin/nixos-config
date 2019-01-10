# Configuration

To silence [the warning](https://ghc.haskell.org/trac/ghc/ticket/15112) about `-nopie`:

```
clang: warning: argument unused during compilation: '-nopie' [-Wunused-command-line-argument]
```

Update your GHC settings (for all installed versions of GHC).
For example:

```
~/.stack/programs/x86_64-osx/ghc-*/lib/ghc-*/settings
```

```
("C compiler supports -no-pie", "NO"),
```

Or, if you don't use stack:

```
/usr/local/lib/ghc-*/settings
```
