# vim guide

## useful vim tips / shortcuts

**Viewport**

```
Ctrl-w = tells Vim to resize viewports to be of equal size.

Ctrl-[HJKL] will move the current viewport to the edges.

Ctrl-w r will rotate windows to the right.

Ctrl-w R will rotate windows to the left.
```

## plugins usage

### fugitive-git

**Glog** - view history of a particular file

Use `<leader>n` and `<leader>m` to go back and between the versions.

Execute `:cw` to view all the commits relating to the file.

**Gdiff** - compare current file with a given revision

`:Gdiff 0e7c` or `:Gdiff HEAD^`

It can also be done interactively by doing the following:

- Display the file history with `Glog`
- Navigate to the desired version using `<leader>n` and `<leader>m` or using the quickfix list with `:cw`
- Using `Gdiff` to compare it with the current version

Compare two different revision:

- Display file history with `Glog`
- Open first revision with `<Enter>`
- Open second revision with `<C-w><Enter>`
- Move the second revision to the right with `<C-w> l`
- `diffthis` on two revisions
