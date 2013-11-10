;;;
;;; usage: $ emacs -Q -L . -l sample.el -f ert-run-tests-and-exit
;;;

(require 'cursor-test)

(ert-deftest test-01 ()
  "test sample. compare expect and actual buffer."
  (cursor-test/equal
   :description "test 01"
   :expect (cursor-test/setup
            :init "
def foo
|
end
")
   :actual (cursor-test/setup
            :init "
def foo |
end
"
            :exercise (lambda ()
                        (ruby-mode)
                        (newline-and-indent)))))

(ert-deftest test-02 ()
  "test sample. compare expect and actual buffer."
  (cursor-test/equal
   :description "test 02"
   :expect (cursor-test/setup
            :init "
def foo
  |
end
")
   :actual (cursor-test/setup
            :init "
def foo|
end
"
            :exercise (lambda ()
                        (ruby-mode)
                        (newline-and-indent)))))

(ert-deftest test-03 ()
  "test sample. compare expect and actual buffer."
  (cursor-test/equal*
   :description "test 03"
   :init "
def foo
|end
"
   :exercise (lambda ()
               (ruby-mode)
               (newline-and-indent))
   :expect "
def foo

|end
"))
