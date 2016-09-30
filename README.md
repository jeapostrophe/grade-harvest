grade-harvest - Tool for having students do work in git for courses

Overview:
- Students do assignments on a single git repository for an entire
  course.
- The root directory contains formatted student information, like
  their name, student ID, and a photo. It should have a `GRADE.txt`
  file managed by the system while stores their course grade
  information.
- Each directory contains the details of a different assignment.
- The professor has a list of the various repositories (one per
  student) and a list of the various assignments (with their due
  date.)
- The professor runs a command to clone all the repositories (or
  update them if already downloaded) --- `grade-harvest pull`
- The professor runs a command to start grading an assignment ---
  `grade-harvest grade $ID`. This does a checkout on each repository
  to the last commit before the due date of the assignment. Then, it
  opens up a Web browser (using `web-server/servlet-env`) that guides
  the professor through the grading process. For now, it can just
  display the student information one at a time, but eventually it
  will check if the repository is complete (each assignment should
  have a list of required files and things to check about them), then
  let the professor open the files (run a local command) and then save
  a grade.
- When the professor saves a grade, it creates a file called
  `grade.rktd` with the grade information. If a student repository
  ever contains this file, it is considered cheating and will be
  marked as such.
- After grading is done, the grade information is turned into a grade
  display `GRADE.txt` based on `grade.rktd` that the student can look
  at. This file gets committed and pushed to the student's repository.
- The professor should be able to get some course-wide and
  per-assignment grade statistics and turn-in information.
  
Thoughts:
- I think that `grade-harvest` should be like a library and every
  different class will be customized via something like:
  
  ```
  #lang at-exp racket/base
  (require grade-harvest)
  (module+ main
   (grade-harvest!
    ;; Assignments
    (list a1 a2 a3)
    ;; Student repositories
    #<<END
url1
url2
url3
END
    ))
  ```
  
  And then this is the file that is normally run.
  
- One way to make grading faster and easier is to have a little
  interface where I can annotate what line of a file there are
  problems and choose from a list of common problems and then just
  plop in the line number by looking at the particular student's work.

- Notes for helping in semi-auto-grading

  301 - Do the thing of having good/bad implementations. Have it have
  me read the code before allowing it to run and then show me the
  results.

  304 - Have the students send a picture of the answer to each
  question

  305 - Match 301 with different interpreter

  308 - Same as 305

  404 - Same as 304
