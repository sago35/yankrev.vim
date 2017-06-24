# yankrev

Yank revision (git-hash) and filename and lineno

## Usage

Use `:Yankrev` like below.

```
nmap gy :Yankrev<cr>
```

## Format

```
case: versioned && modified

    plugin/yankrev.vim:43@43cd9ec0c6a1a089634efb3e601d158c7b4c38e9

case: versioned && not modified

    plugin/yankrev.vim:43@43cd9ec0c6a1a089634efb3e601d158c7b4c38e9*

case: not versioned

    plugin/xxxxxxx.vim:43
```
