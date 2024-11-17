# Bandit Level 3 → Level 4 Solution

## Objective
The goal for Bandit Level 3 → Level 4 was to find the password for the next level, which was hidden in a file named `...Hiding-From-You` within the `inhere` directory.

---

## What Was Tried and Did Not Work

### 1. Listing Files with `ls -l`
```bash
bandit3@bandit:~$ ls -l
total 4
drwxr-xr-x 2 root root 4096 Sep 19 07:08 inhere
```

**Outcome**:  
This command listed the `inhere` directory but did not reveal any specific files within it. At this point, I had no indication of hidden files.

---

### 2. Entering the `inhere` Directory and Using `ls -l`
```bash
bandit3@bandit:~/inhere$ ls -l
total 0
```

**Outcome**:  
This command showed no files in the directory, but I suspected there could be hidden files.

---

## What Worked

### 1. Listing All Files, Including Hidden Files, with `ls -la`
```bash
bandit3@bandit:~/inhere$ ls -la
total 12
drwxr-xr-x 2 root    root    4096 Sep 19 07:08 .
drwxr-xr-x 3 root    root    4096 Sep 19 07:08 ..
-rw-r----- 1 bandit4 bandit3   33 Sep 19 07:08 ...Hiding-From-You
```

**Outcome**:  
The `ls -la` command revealed the hidden file `...Hiding-From-You`, which was not visible with previous commands.

---

### 2. Reading the Hidden File with `cat`
```bash
bandit3@bandit:~/inhere$ cat ./...Hiding-From-You
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```

**Outcome**:  
The `cat` command successfully displayed the password for the next level:  
`2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ`.

---

## Conclusion

To solve Bandit Level 3 → Level 4:
1. Use `ls -la` to reveal hidden files in the directory.
2. Use `cat` to read the file and extract the password.

This challenge demonstrated the importance of thoroughly exploring directories using commands like `ls -la`.

---

## Key Commands
- `ls -l`: Lists files but does not show hidden files.
- `ls -la`: Lists all files, including hidden ones (those prefixed with `.`, like `...Hiding-From-You`).
- `cat`: Displays the content of files.

---

## Password for Level 4:
```plaintext
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```
