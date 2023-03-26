
;; title: stack-token
;; version:
;; summary:
;; description:

;; traits
;; this contract contains all functions for fungible token.
(impl-trait 'SP3FBR2AGK5H9QBDH3EEN6DF8EK8JY7RX8QJ5SVTE.sip-010-trait-ft-standard.sip-010-trait)


;; token definitions
;; An optional maximum total supply can be defined by 
;; provider an unsigned integer as the second parameter. 
;; If left out, the token has no maximum total supply. 
;; Setting a maximum total supply ensures that no more than 
;; the provided amount can ever be minted.
(define-fungible-token ertx u1000000)

;; Mint 1,000 tokens and give them to tx-sender
(ft-mint? ertx u1000 tx-sender)

;; Transfer 500 tokens from tx-sender to the contract.
(ft-transfer? ertx u500 tx-sender (as-contract tx-sender))

;; Get and print the token balance of tx-sender.
(print (ft-get-balance ertx tx-sender))

;; Burn 250 tokens (destroys them)
(ft-burn? ertx u250 tx-sender)

;; Get and print the circulating supply
(print (ft-get-supply ertx))

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
(define-public (mint-token-to-sender (sender principal) (amount uint)) 
   (ok (ft-mint? ertx amount sender))
)

(define-public (transfer-token (sender principal) (to principal) (amount uint)) 
  (begin 
    (try! (ft-transfer? ertx amount sender to))
    (ok true)
  )
  ;;(ok (ft-transfer? ertx amount sender to))
)

(define-public (get-account-balance (account principal)) 
  (ok (ft-get-balance ertx account))
)

(define-public (burn-tokens (sender principal) (amount uint)) 
  (ok (ft-burn? ertx amount tx-sender))
)

(define-public (get-cirulating-supply) 
  (ok (ft-get-supply ertx))
)

;; read only functions
;;

;; private functions
;;

