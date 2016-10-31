#lang racket/base
(require gregor)

(define (do-grading! course-dir
                     #:students list-of-students
                     #:hws list-of-hws)
  (for ([s list-of-students])
    ;; XXX Update the git repository
    (for ([h list-of-hws])
      ;; XXX Checkout the repository as-of the due-date
      (unless (directory-exists? (build-path course-dir s h))
        ;; XXX Check the required files
        ;; XXX Do the grading
        (printf "~v is missing ~v\n"
                s h)))))

(struct student-info (id name repo-url))
(struct hw-info (name due-date files))

(module+ main
  (require racket/cmdline)
  (command-line
   #:args (course-dir)
   (do-grading!
    course-dir
    #:students
    (list (student-info "04451"
                        "Jay"
                        "git://....")
          "student2" "student3")
    #:hws
    (list (hw-info "hw1"
                   (date 2016 10 31)
                   (list "README"
                         "main.c"))
          "hw2" "hw3"))))
