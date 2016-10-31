#lang racket/base

(define (parse-course-directory course-dir)
  (for ([student (directory-list course-dir)])
    (printf "~v is in ~v\n" student course-dir)
    (for ([hw (directory-list (build-path course-dir student))])
      (printf "~v's hw is ~v\n" student hw)
      (process-homework (build-path course-dir student hw)))))

(define (process-homework hw-dir)
  (printf "hw dir is ~v\n" hw-dir)
  (unless (file-exists? (build-path hw-dir "grade.txt"))
    (printf "Ungraded\n")
    (unless (file-exists? (build-path hw-dir "README"))
      (printf "Student missing README\n"))))

(module+ main
  (require racket/cmdline)
  (command-line
   #:args (course-dir)
   (printf "The directory is: ~v\n" course-dir)
   (parse-course-directory course-dir)))
