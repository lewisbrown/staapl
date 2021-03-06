#lang scheme/base

(require
 (for-syntax scheme/base)
 "../op.ss"
 "../ns.ss"
 "../tools.ss"
 "../scat.ss"
 "pattern.ss"
 "macro-utils.ss"

 "../asm/directives.ss"

 )

(provide

 (ns-out (scat)
   (combine-out compile    ;; compile word refernce (struct target-word)
                literal))  ;; compile literal value (target-value)
 macro-prim:

 lit

 (op-combine-out   qw cw)

 ;; For matching
 qw? cw?)

;; Macro primitives are just scat words.
(define-syntax-rule (macro-prim: . code) (scat: . code))

;; The core virtual words used in the macro evaluator.
(define-virtual-ops
  (qw value)
  (cw addr))


(define (qw? x) (eq? x (asm: qw)))
(define (cw? x) (eq? x (asm: cw)))
                      
        
  

;; These are words that most certainly need to be redefined at some
;; point when mapping to a target architecture. They are used in
;; target-rep.ss to implement the core of macro/forth/variable.

(compositions
 (scat) scat:
 
 (literal ',(asm: qw) >tag)
 (compile ',(asm: cw) >tag))


;; Used in macro-tx.ss : macro-immedate
(define (lit datum) (macro-prim: ',datum literal))
