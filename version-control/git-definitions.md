# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
    Version control is a means of managing the source code of a file. Using version control one can track all the changes on the file in the .git folder. If for some reason a mistake is made or an addition is unwanted on the file, programmers can easily roll back to recent working version of the file and continue from there.


* What is a branch and why would you use one?
    Branch =  when a repository is copied to be worked on(branch) so you don't have to work and potentially break the original(master). Branches can be merged back to the master repository after everything is deemed okay.


* What is a commit? What makes a good commit message?
    commit =  saving changes to the repository after making changes.
    best practice I believe is to leave a summary of what changed and why you changed it in the commit message.


* What is a merge conflict?
    When you try to merge a branch, but the branch has content on the same line as the master. For example on the master there is "hello world!" on line 1 and the branch has "hello class!" in line 1. Since they both have content on the same location, the computer does not know how to resolve this and would need to be resolved manually.


* Added more text