(* ============================================================================ *)
(* Programação Funcional - Ficha de Exercícios 2: Recursividade Normal e      *)
(* Terminal                                                                     *)
(* Última atualização: 2026-03-05                                              *)
(* ============================================================================ *)

let () = Printf.printf "\n=====================================\n"
let () = Printf.printf "FICHA 2: RECURSIVIDADE\n"
let () = Printf.printf "=====================================\n\n"

(* ============================================================================ *)
(* EXERCÍCIO 1: Função dobro                                                   *)
(* ============================================================================ *)

let _ = Printf.printf "\n===== Exercício 1 - Função dobro =====\n\n"

(* Escrever uma função double que recebe um inteiro e devolve o seu dobro. *)
(* Tipo: int -> int *)
let double x = 2 * x

let () = Printf.printf "double 5 = %d\n" (double 5)
let () = Printf.printf "double 10 = %d\n" (double 10)
let () = Printf.printf "double 0 = %d\n\n" (double 0)

(* ============================================================================ *)
(* EXERCÍCIO 2: Função máximo                                                  *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 2 - Função máximo =====\n\n"

(* Escrever uma função max x y que devolve o maior de dois números inteiros. *)
(* Tipo: int -> int -> int *)
let max x y = if x > y then x else y

let () = Printf.printf "max 5 3 = %d\n" (max 5 3)
let () = Printf.printf "max 10 10 = %d\n" (max 10 10)
let () = Printf.printf "max 2 8 = %d\n\n" (max 2 8)

(* ============================================================================ *)
(* EXERCÍCIO 3: Fatorial                                                       *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 3 - Fatorial =====\n\n"

(* Escrever uma função recursiva factorial n que calcula n! *)
(* Tipo: int -> int *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n - 1)

let () = Printf.printf "factorial 5 = %d\n" (factorial 5)
let () = Printf.printf "factorial 0 = %d\n" (factorial 0)
let () = Printf.printf "factorial 1 = %d\n"  (factorial 1)
let () = Printf.printf "factorial 6 = %d\n\n" (factorial 6)

(* ============================================================================ *)
(* EXERCÍCIO 4: Soma dos pares                                                 *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 4 - Soma dos pares =====\n\n"

(* Escrever uma função recursiva soma_pares n que calcula a soma de todos os *)
(* números pares entre 0 e n (inclusive).                                     *)
(* Exemplo: soma_pares 6 = 12  (0 + 2 + 4 + 6 = 12)                           *)
(* Tipo: int -> int *)
let rec soma_pares n =
  if n < 0 then 0
  else if n mod 2 = 0 then n + soma_pares (n - 2)
  else soma_pares (n - 1)

let () = Printf.printf "soma_pares 6 = %d\n" (soma_pares 6)
let () = Printf.printf "soma_pares 10 = %d\n" (soma_pares 10)
let () = Printf.printf "soma_pares 5 = %d\n" (soma_pares 5)
let () = Printf.printf "soma_pares 0 = %d\n\n" (soma_pares 0)

(* ============================================================================ *)
(* EXERCÍCIO 5: Soma de dígitos                                                *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 5 - Soma de dígitos =====\n\n"

(* Escrever uma função que calcula a soma dos dígitos de um número. *)
(* Exemplo: soma_digitos 1234 = 10                                  *)
(* Tipo: int -> int *)
let rec soma_digitos n =
  if n < 10 then n
  else (n mod 10) + soma_digitos (n / 10)

let () = Printf.printf "soma_digitos 1234 = %d\n" (soma_digitos 1234)
let () = Printf.printf "soma_digitos 567 = %d\n" (soma_digitos 567)
let () = Printf.printf "soma_digitos 5 = %d\n" (soma_digitos 5)
let () = Printf.printf "soma_digitos 999 = %d\n\n" (soma_digitos 999)

(* ============================================================================ *)
(* EXERCÍCIO 6: Potência (versão não terminal)                                 *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 6 - Potência (não terminal) =====\n\n"

(* Escrever uma versão recursiva não terminal da função potência. *)
(* Tipo: int -> int -> int *)
let rec power base exp =
  if exp = 0 then 1
  else base * power base (exp - 1)

let () = Printf.printf "power 2 3 = %d\n" (power 2 3)
let () = Printf.printf "power 5 2 = %d\n" (power 5 2)
let () = Printf.printf "power 10 0 = %d\n" (power 10 0)
let () = Printf.printf "power 3 4 = %d\n\n" (power 3 4)

(* ============================================================================ *)
(* EXERCÍCIO 7: Função mistério                                                *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 7 - Função mistério =====\n\n"

(* Dada a função:                                                  *)
(* let rec foo x y = if y = 0 then 0 else x + foo x (y-1)        *)
(* • Qual é o tipo?                                                *)
(* • Qual é o valor de foo 3 4 ?                                   *)
(* • O que calcula esta função?                                    *)

let rec foo x y =
  if y = 0 then 0
  else x + foo x (y - 1)

let () = Printf.printf "Tipo: int -> int -> int\n"
let () = Printf.printf "foo 3 4 = %d\n" (foo 3 4)
let () = Printf.printf "Explicação: Calcula x * y\n"
let () = Printf.printf "  foo 3 4 = 3 + (3 + (3 + 3)) = 3 * 4 = 12\n"
let () = Printf.printf "foo 5 3 = %d (deve ser 15)\n\n" (foo 5 3)

(* ============================================================================ *)
(* EXERCÍCIO 8: Número invertido                                               *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 8 - Número invertido =====\n\n"

(* Escrever uma função numero_invertido n que devolve o número com os        *)
(* dígitos invertidos.                                                         *)
(* Exemplo: numero_invertido 1234 = 4321                                       *)
(* Tipo: int -> int *)

let numero_invertido n =
  let rec aux num acc =
    if num = 0 then acc
    else aux (num / 10) (acc * 10 + num mod 10)
  in
  aux n 0

let () = Printf.printf "numero_invertido 1234 = %d\n" (numero_invertido 1234)
let () = Printf.printf "numero_invertido 567 = %d\n" (numero_invertido 567)
let () = Printf.printf "numero_invertido 100 = %d\n" (numero_invertido 100)
let () = Printf.printf "numero_invertido 9 = %d\n\n" (numero_invertido 9)

(* ============================================================================ *)
(* EXERCÍCIO 9: Contar dígitos                                                 *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 9 - Contar dígitos =====\n\n"

(* Escrever uma função que conta quantos dígitos tem um número. *)
(* Tipo: int -> int *)

let contar_digitos n =
  let rec aux num count =
    if num = 0 then count
    else aux (num / 10) (count + 1)
  in
  if n = 0 then 1
  else aux n 0

let () = Printf.printf "contar_digitos 1234 = %d\n" (contar_digitos 1234)
let () = Printf.printf "contar_digitos 567 = %d\n" (contar_digitos 567)
let () = Printf.printf "contar_digitos 0 = %d\n" (contar_digitos 0)
let () = Printf.printf "contar_digitos 100000 = %d\n\n" (contar_digitos 100000)

(* ============================================================================ *)
(* EXERCÍCIO 10: Fibonacci                                                     *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 10 - Fibonacci =====\n\n"

(* Versão não terminal (como no exercício) *)
(* let rec fib n = if n <= 2 then 1 else fib (n-1) + fib (n-2) *)

let rec fib_nonterminal n =
  if n <= 2 then 1
  else fib_nonterminal (n - 1) + fib_nonterminal (n - 2)

let () = Printf.printf "Versão não terminal:\n"
let () = Printf.printf "fib 5 = %d\n" (fib_nonterminal 5)
let () = Printf.printf "Cálculo à mão:\n"
let () = Printf.printf "  fib 5 = fib 4 + fib 3\n"
let () = Printf.printf "        = (fib 3 + fib 2) + (fib 2 + fib 1)\n"
let () = Printf.printf "        = ((fib 2 + fib 1) + 1) + (1 + 1)\n"
let () = Printf.printf "        = ((1 + 1) + 1) + 2\n"
let () = Printf.printf "        = 3 + 2\n"
let () = Printf.printf "        = 5\n\n"

let () = Printf.printf "Esta função NÃO é recursiva terminal.\n"
let () = Printf.printf "Justificação: Após a chamada recursiva, ainda é necessário\n"
let () = Printf.printf "fazer uma adição com o resultado, então não é a última operação.\n\n"

(* Versão terminal com dois acumuladores *)
let rec fib_terminal n acc1 acc2 =
  if n <= 1 then acc1
  else if n = 2 then acc2
  else fib_terminal (n - 1) acc2 (acc1 + acc2)

(* Wrapper para versão terminal *)
let fib_term n =
  if n <= 0 then 0
  else fib_terminal n 1 1

let () = Printf.printf "Versão terminal:\n"
let () = Printf.printf "fib_term 5 = %d\n" (fib_term 5)
let () = Printf.printf "fib_term 10 = %d\n" (fib_term 10)
let () = Printf.printf "fib_term 1 = %d\n\n" (fib_term 1)

(* ============================================================================ *)
(* EXERCÍCIO 11: É primo                                                       *)
(* ============================================================================ *)

let _ = Printf.printf "===== Exercício 11 - É primo =====\n\n"

(* Escrever uma função primo n que verifica se um número é primo. *)
(* Exemplo: primo 9 = false                                        *)
(* Tipo: int -> bool *)

let primo n =
  let rec aux divisor =
    if divisor * divisor > n then true
    else if n mod divisor = 0 then false
    else aux (divisor + 1)
  in
  if n < 2 then false
  else aux 2

let () = Printf.printf "primo 9 = %b\n" (primo 9)
let () = Printf.printf "primo 7 = %b\n" (primo 7)
let () = Printf.printf "primo 2 = %b\n" (primo 2)
let () = Printf.printf "primo 1 = %b\n" (primo 1)
let () = Printf.printf "primo 17 = %b\n" (primo 17)
let () = Printf.printf "primo 20 = %b\n\n" (primo 20)

(* ============================================================================ *)
let () = Printf.printf "\n=====================================\n"
let () = Printf.printf "FIM DA FICHA 2\n"
let () = Printf.printf "=====================================\n\n"
