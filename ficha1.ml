(* ============================================================================ *)
(* Programação Funcional - Folha de Exercícios 1: Tipos, Avaliação e Erros    *)
(* Autor: OCaml Expert Solution                                               *)
(* Data: 2026-02-27                                                            *)
(* ============================================================================ *)

let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 1: TIPOS DE EXPRESSÕES\n"
let () = Printf.printf "========================================\n\n"

(* Expresão 1: let f x = x + 2 *)
(* Tipo: int -> int *)
let f1_1 x = x + 2
let () = Printf.printf "f1_1 5 = %d\n" (f1_1 5)

(* Expressão 2: let f x y = x +. (float y) *)
(* Tipo: float -> int -> float *)
let f1_2 x y = x +. (float_of_int y)
let () = Printf.printf "f1_2 3.5 2 = %f\n" (f1_2 3.5 2)

(* Expressão 3: let x = sin 5. in 2.*. x *)
(* Tipo: float *)
let expr1_3 = let x = sin 5. in 2. *. x
let () = Printf.printf "sin 5.0 * 2.0 = %f\n" expr1_3

(* Expressão 4: let x = 3. in let y = 2 in if x > 1. then 3. ** 9. else cos 1. *)
(* Tipo: float *)
let expr1_4 = let x = 3. in let _ = 2 in if x > 1. then 3. ** 9. else cos 1.
let () = Printf.printf "3.0 ** 9.0 = %f\n" expr1_4

(* Expressão 5: let f x (y,z) = if x then y else not z *)
(* Tipo: bool -> (bool * bool) -> bool *)
let f1_5 x (y,z) = if x then y else not z
let () = Printf.printf "f1_5 true (false, true) = %b\n" (f1_5 true (false, true))

(* Expressão 6: let f x y z = (x <= y, z) *)
(* Tipo: 'a -> 'a -> 'b -> (bool * 'b) *)
let f1_6 x y z = (x <= y, z)
let () = Printf.printf "f1_6 3 5 \"hello\" = (%b, \"hello\")\n" (fst (f1_6 3 5 "hello"))

(* Expressão 7: fun x y z -> (x <= y, if z <= x then x else y) *)
(* Tipo: 'a -> 'a -> 'a -> (bool * 'a) *)
let f1_7 = fun x y z -> (x <= y, if z <= x then x else y)
let () = Printf.printf "f1_7 3 5 4 = (%b, %d)\n" (fst (f1_7 3 5 4)) (snd (f1_7 3 5 4))

(* Expressão 8: let f x y z = (x <= y, if z <= x then x else y) *)
(* Tipo: 'a -> 'a -> 'a -> (bool * 'a) *)
(* Identical to expresão 7, just using let instead of fun *)

(* Expressão 9: let f = fun x y z -> (x <= y, if z <= x then x else y) *)
(* Tipo: 'a -> 'a -> 'a -> (bool * 'a) *)
(* All three are functionally equivalent *)

let () = Printf.printf "\n[Nota] Expressões 7, 8 e 9 são equivalentes.\n"
let () = Printf.printf "    - Expr 7: fun directo\n"
let () = Printf.printf "    - Expr 8: let com função\n"
let () = Printf.printf "    - Expr 9: let com atribuição de fun\n\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 2: ERROS DE AVALIAÇÃO\n"
let () = Printf.printf "========================================\n\n"

(* f1: let f1 x g z = if x then g x else g z *)
(* Tipo: bool -> (bool -> 'b) -> bool -> 'b *)
let f2_1 x g z = if x then g x else g z
let () = Printf.printf "f2_1: bool -> (bool -> 'b) -> bool -> 'b ✓\n"
let test_f2_1 = f2_1 false (fun b -> if b then "verdadeiro" else "falso") true
let () = Printf.printf "f2_1 false (fun b -> ...) true = \"%s\"\n" test_f2_1

(* f2: let f2 f g x = if f x then g x *)
(* ERRO: Incompatible types - g x deveria retornar algo (else é obrigatório) *)
(* Correcção: adicionar else clause *)
let f2_2 f g x = if f x then g x else (-1)  (* correção: adicionar else *)
let () = Printf.printf "\nf2_2: ERRO - missing else clause\n"
let () = Printf.printf "Correcção: if f x then g x else <algo>\n"

(* f3: let f3 g x y = if g x then g y *)
(* ERRO: mesmo problema como f2 *)
let f2_3 g x y = if g x then g y else g y  (* correção: else clause *)
let () = Printf.printf "\nf2_3: ERRO - missing else clause\n"

(* f4: let rec f4 x y = f4 y ([]::x) *)
(* ERRO: Type mismatch - []::x onde x deveria ser lista *)
(* Tipo esperado: 'a list -> 'a list -> 'b *)
(* Conflito: [] é 'a list, ([]::x) espera 'a mas x é algo else *)
let () = Printf.printf "\nf2_4: ERRO - type mismatch in recursive call\n"
let () = Printf.printf "[]::x requer x: 'a list list, mas tipos conflituam\n"

(* f5: let f5 g f x = if x<0 then f (g x) else g (f x) *)
(* Tipo: (int -> 'a) -> ('b -> int) -> int -> ? *)
(* ERRO: g espera 'a mas f retorna 'b - types incompativeis *)
let () = Printf.printf "\nf2_5: ERRO - type mismatch\n"
let () = Printf.printf "g retorna 'a, mas f espera int como input\n"

(* f6: let f6 g f x y1 = if x<y then f (g x) else g (f y) *)
(* ERRO: y não está definido (é y1, não y) *)
let () = Printf.printf "\nf2_6: ERRO - undefined variable 'y'\n"
let () = Printf.printf "Parâmetro é y1, mas usamos y na expressão\n"

(* f7: let f7 x y = if x > 0 || y < 0. then x else y *)
(* ERRO: Type mismatch - x é int (de x > 0), y é float (de y < 0.) *)
let () = Printf.printf "\nf2_7: ERRO - type mismatch\n"
let () = Printf.printf "x > 0 requer int, mas y < 0. requer float\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 3: FUNÇÕES SOMA E MULT\n"
let () = Printf.printf "========================================\n\n"

(* Definição das funções soma e mult *)
let soma x y = x + y  (* soma x e y *)
let mult x y = x * y  (* multiplica x e y *)

let () = Printf.printf "Tipo de soma: int -> int -> int\n"
let () = Printf.printf "Tipo de mult: int -> int -> int\n\n"

(* Questão 2: soma 2 (soma 2 (soma 2 2)) *)
let result_2 = soma 2 (soma 2 (soma 2 2))
let () = Printf.printf "soma 2 (soma 2 (soma 2 2)) = %d\n" result_2
let () = Printf.printf "  = soma 2 (soma 2 4) = soma 2 6 = 8\n\n"

(* Questão 3: Cálculo de ∑(i=1 to n) 2 = 2*n *)
let () = Printf.printf "Soma de constante 2 de 1 até n: ∑ 2 = 2*n\n"
let () = Printf.printf "  Exemplo: n=5, resultado = 2*5 = 10\n\n"

(* Questão 4: mult 2 (mult 2 (mult 2 2)) *)
let result_4 = mult 2 (mult 2 (mult 2 2))
let () = Printf.printf "mult 2 (mult 2 (mult 2 2)) = %d\n" result_4
let () = Printf.printf "  = mult 2 (mult 2 4) = mult 2 8 = 16\n\n"

(* Questão 5: Cálculo de ∏(i=1 to n) 2 = 2^n *)
let () = Printf.printf "Produto de constante 2 de 1 até n: ∏ 2 = 2^n\n"
let () = Printf.printf "  Exemplo: n=5, resultado = 2^5 = 32\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 4: MISTERIO\n"
let () = Printf.printf "========================================\n\n"

(* Função misterio: calcula x*y + z *)
let rec misterio x y z =
  if y <= 0 then z else misterio x (y - 1) (x + z)

let () = Printf.printf "Tipo de misterio: int -> int -> int -> int\n\n"

(* Questão 2: misterio 2 3 0 *)
let result_misterio = misterio 2 3 0
let () = Printf.printf "misterio 2 3 0 = %d\n" result_misterio
let () = Printf.printf "  Passo 1: misterio 2 2 2 (x + z = 2 + 0)\n"
let () = Printf.printf "  Passo 2: misterio 2 1 4 (x + z = 2 + 2)\n"
let () = Printf.printf "  Passo 3: misterio 2 0 6 (x + z = 2 + 4)\n"
let () = Printf.printf "  Resultado: 6\n\n"

let () = Printf.printf "Explicação: Calcula x*y + z\n"
let () = Printf.printf "  misterio 2 3 0 = 2*3 + 0 = 6 ✓\n\n"

(* Questão 4: Alterar para calcular z × ∏(i=1 to n) 2 *)
let () = Printf.printf "Para calcular z × ∏(2)^n:\n"
let () = Printf.printf "  Mudar (x + z) para (x * z)\n"
let rec misterio_produto x y z =
  if y <= 0 then z else misterio_produto x (y - 1) (x * z)

let result_prod = misterio_produto 2 3 1
let () = Printf.printf "  misterio_produto 2 3 1 = %d = 1 × 2³ = 8\n" result_prod

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 5: MISTERIO BINÁRIO\n"
let () = Printf.printf "========================================\n\n"

(* Função misterio: converte int para string binária *)
let rec misterio_bin d r =
  if d = 0 then r
  else
    let a = (d lsr 1) in           (* right shift: d / 2 *)
    let b = (string_of_int (d land 1)) in  (* bit menos significativo *)
    misterio_bin a (b ^ r)

let () = Printf.printf "Tipo de misterio_bin: int -> string -> string\n\n"

(* Questão 2: misterio_bin 13 "" *)
let result_bin = misterio_bin 13 ""
let () = Printf.printf "misterio_bin 13 \"\" = \"%s\"\n" result_bin
let () = Printf.printf "  13 em binário = 1101\n\n"

let () = Printf.printf "Explicação: Converte inteiro para representação binária\n"
let () = Printf.printf "  d lsr 1 = divisão por 2 (shift direita)\n"
let () = Printf.printf "  d land 1 = bit menos significativo\n"
let () = Printf.printf "  Concatena bits na ordem inversa\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 6: MAIS ERROS DE AVALIAÇÃO\n"
let () = Printf.printf "========================================\n\n"

(* Expressão 1: let quarto_de_pi = 3.14 / 4. *)
(* ERRO: / é para int, deve ser /. para float *)
let () = Printf.printf "Erro 1: 3.14 / 4.\n"
let () = Printf.printf "  Problema: / é operador de inteiros\n"
let quarto_de_pi = 3.14 /. 4.  (* Correcção *)
let () = Printf.printf "  Correcção: 3.14 /. 4.\n"
let () = Printf.printf "  Resultado: %f\n\n" quarto_de_pi

(* Expressão 2: let em_ordem = 1 < 2 < 3 *)
(* ERRO: (1 < 2) retorna bool, bool < 3 é type error *)
let () = Printf.printf "Erro 2: 1 < 2 < 3\n"
let () = Printf.printf "  Problema: (1 < 2) é bool, bool < 3 é inválido\n"
let em_ordem = (1 < 2) && (2 < 3)  (* Correcção *)
let () = Printf.printf "  Correcção: (1 < 2) && (2 < 3)\n"
let () = Printf.printf "  Resultado: %b\n\n" em_ordem

(* Expressão 3: let positivo = let a = 42 in if a >= 0 then true *)
(* ERRO: missing else clause *)
let () = Printf.printf "Erro 3: if a >= 0 then true (missing else)\n"
let () = Printf.printf "  Problema: if sem else\n"
let positivo = let a = 42 in if a >= 0 then true else false  (* Correcção *)
let () = Printf.printf "  Correcção: if a >= 0 then true else false\n"
let () = Printf.printf "  Resultado: %b\n\n" positivo

(* Expressão 4: let duplo_positivo = ... *)
let () = Printf.printf "Erro 4: Expressão válida\n"
let duplo_positivo = let x = cos 5. in (if (x < 0.) then (-.x) else x) *. 2.
let () = Printf.printf "  Resultado: %f (valor absoluto de cos(5) * 2)\n\n" duplo_positivo

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 7: AINDA MAIS ERROS DE AVALIAÇÃO\n"
let () = Printf.printf "========================================\n\n"

(* Expressão 1: let r = let x = 7 in 6 * x *)
let r = let x = 7 in 6 * x
let () = Printf.printf "r = let x = 7 in 6 * x\n"
let () = Printf.printf "  Tipo: int, Valor: %d ✓\n\n" r

(* Expressão 2: let a = (r - 6) / 6 - 6 *)
let a = (r - 6) / 6 - 6
let () = Printf.printf "a = (r - 6) / 6 - 6\n"
let () = Printf.printf "  Tipo: int, Valor: %d ✓\n" a
let () = Printf.printf "  = (42 - 6) / 6 - 6 = 36 / 6 - 6 = 6 - 6 = 0\n\n"

(* Expressão 3: let o = r * r - x * x - 51 *)
(* ERRO: x não está definido no escopo *)
let () = Printf.printf "o = r * r - x * x - 51\n"
let () = Printf.printf "  ERRO: x não está definido (foi definido em let r)\n"
let o = let x = 7 in r * r - x * x - 51  (* Correcção: redefinir x *)
let () = Printf.printf "  Correcção: let x = 7 in r * r - x * x - 51\n"
let () = Printf.printf "  Tipo: int, Valor: %d ✓\n\n" o

(* Expressão 4: let u = let x = 9 in if (x<9) then 9 / (x - x) else (x+x) / 9 *)
(* ERRO: Divisão por zero na branch then, mas a avaliação é lazy no else *)
let () = Printf.printf "u = let x = 9 in if (x<9) then 9 / (x - x) else (x+x) / 9\n"
let () = Printf.printf "  AVISO: (x < 9) é falso, então else é executado\n"
let u = let x = 9 in if (x < 9) then 9 / (x - x) else (x + x) / 9
let () = Printf.printf "  Tipo: int, Valor: %d ✓\n\n" u

(* Expressão 5: let x = let a = 10 in if a>7 || b / (a - a) then "ola" else "tudo bem" *)
(* ERRO: b não está definido, e (a - a) = 0 causa divisão por zero *)
let () = Printf.printf "Expressão 5: if a>7 || b / (a - a) then ...\n"
let () = Printf.printf "  ERRO: b não definido\n"
let () = Printf.printf "  ERRO: (a - a) = 0, b/0 é undefined\n"
let () = Printf.printf "  Correcção: usar variável definida ou remover divisão\n\n"

(* Expressão 6: let x = let a = 10 in if a>7 || b / (a - a) then "ola" *)
(* ERRO: missing else clause E b não definido *)
let () = Printf.printf "Expressão 6: if a>7 || b / (a - a) then \"ola\" (missing else)\n"
let () = Printf.printf "  ERRO: missing else clause\n"
let () = Printf.printf "  ERRO: b não definido\n\n"

(* Expressão 7: let x = let a = 10 in if a < 7 && b / (a - a) then "ola" else "tudo bem" *)
(* NOTA: (a < 7) é falso, então && short-circuits e não avalia b / (a - a) *)
let () = Printf.printf "Expressão 7: if a < 7 && b / (a - a) then ...\n"
let () = Printf.printf "  NOTA: (a < 7) é falso, && short-circuits\n"
let () = Printf.printf "  Então b / (a - a) não é avaliado\n"
let x7 = let a = 10 in if a < 7 && (true) then "ola" else "tudo bem"
let () = Printf.printf "  Tipo: string, Valor: %s ✓\n\n" x7

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 8: CHOICE MÚLTIPLA - TIPOS\n"
let () = Printf.printf "========================================\n\n"

let () = Printf.printf "1. let f (x:int) = x + 1\n"
let () = Printf.printf "   Resposta: int -> int ✓\n\n"

let () = Printf.printf "2. let x = 1\n"
let () = Printf.printf "   Resposta: int ✓\n\n"

let () = Printf.printf "3. let x y = y + 1\n"
let () = Printf.printf "   Resposta: int -> int ✓\n\n"

let () = Printf.printf "4. let f x y = x +. y\n"
let () = Printf.printf "   Resposta: float -> float -> float ✓\n\n"

let () = Printf.printf "5. let f1 x y = Printf.printf \"%%d\" x; y + 3\n"
let () = Printf.printf "   Resposta: int -> int -> int ✓\n"
let () = Printf.printf "   (Printf.printf retorna unit, ; sequencia)\n\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 9: EXPRESSÕES BEM TIPIFICADAS\n"
let () = Printf.printf "========================================\n\n"

(* Expressão 1: let s1 = "a" + "b" *)
let () = Printf.printf "1. let s1 = \"a\" + \"b\"\n"
let () = Printf.printf "   ERRO: + é para números, não strings\n"
let s1 = "a" ^ "b"  (* Correcção *)
let () = Printf.printf "   Correcção: \"a\" ^ \"b\" = \"%s\"\n\n" s1

(* Expressão 2: let s2 = "a" ^ "b" *)
let () = Printf.printf "2. let s2 = \"a\" ^ \"b\"\n"
let s2 = "a" ^ "b"
let () = Printf.printf "   ✓ Correto: \"%s\"\n\n" s2

(* Expressão 3: let s3 = "a" ^ 'b' *)
let () = Printf.printf "3. let s3 = \"a\" ^ 'b'\n"
let () = Printf.printf "   ERRO: ^ requer ambos strings, 'b' é char\n"
let s3 = "a" ^ String.make 1 'b'  (* Correcção *)
let () = Printf.printf "   Correcção: \"a\" ^ (String.make 1 'b') = \"%s\"\n\n" s3

(* Expressão 4: let s4 = 'a' ^ 'b' *)
let () = Printf.printf "4. let s4 = 'a' ^ 'b'\n"
let () = Printf.printf "   ERRO: ^ é para strings, não chars\n"
let s4 = String.make 1 'a' ^ String.make 1 'b'  (* Correcção *)
let () = Printf.printf "   Correcção: (String.make 1 'a') ^ (String.make 1 'b') = \"%s\"\n\n" s4

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 10: MANIPULAÇÃO DE TUPLOS\n"
let () = Printf.printf "========================================\n\n"

let n1 = (1, 2, 3, 4, 5)
let () = Printf.printf "Tuplo: n1 = (1, 2, 3, 4, 5)\n"
let () = Printf.printf "Aceder ao 4º elemento (valor 4):\n\n"

let () = Printf.printf "1. n1[3] - ERRO (OCaml não usa indexação [])\n"
let () = Printf.printf "2. n1[4] - ERRO (OCaml não usa indexação [])\n\n"

let () = Printf.printf "3. let a,b,c,d,e = n1 - ✓ CORRETO\n"
let a, b, c, d, e = n1
let () = Printf.printf "   d = %d\n\n" d

let () = Printf.printf "4. let a,b,c,_,e = n1 - ✓ CORRETO (ignora 4º)\n"
let a4, b4, c4, _, e4 = n1
let () = Printf.printf "   Ignora d com _, captura outros valores\n\n"

let () = Printf.printf "5. let _,_,_,d,_ = n1 - ✓ CORRETO (captura apenas d)\n"
let _, _, _, d5, _ = n1
let () = Printf.printf "   d = %d\n\n" d5

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 11: CHAMADAS DE FUNÇÕES\n"
let () = Printf.printf "========================================\n\n"

let () = Printf.printf "Seja f : (string * string) -> string\n\n"

let () = Printf.printf "1. f a b c - ERRO\n"
let () = Printf.printf "   Razão: f espera tuplo, mas recebe 3 argumentos\n\n"

let () = Printf.printf "2. f (a,b) - ✓ CORRETO (se a,b são strings)\n"
let () = Printf.printf "   Passa tuplo como esperado\n\n"

let () = Printf.printf "3. f \"hello\" \"world\" - ERRO\n"
let () = Printf.printf "   Razão: f espera tuplo, recebe 2 argumentos separados\n\n"

let () = Printf.printf "4. f (\"hello\",\"world\") - ✓ CORRETO\n"
let () = Printf.printf "   Passa tuplo de duas strings\n\n"

(* Demonstração com função real *)
let concat_pair (s1, s2) = s1 ^ " " ^ s2
let () = Printf.printf "Exemplo real:\n"
let () = Printf.printf "  concat_pair (\"hello\", \"world\") = \"%s\"\n\n" 
          (concat_pair ("hello", "world"))

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "SECÇÃO 12: AMBIENTES ESTÁTICO E DINÂMICO\n"
let () = Printf.printf "========================================\n\n"

let () = Printf.printf "Programa OCaml demonstrando ambientes:\n\n"

let x = 34
let () = Printf.printf "let x = 34\n"
let () = Printf.printf "  Ambiente estático: x : int\n"
let () = Printf.printf "  Ambiente dinâmico: x → %d\n\n" x

let y = 17
let () = Printf.printf "let y = 17\n"
let () = Printf.printf "  Ambiente estático: x : int; y : int\n"
let () = Printf.printf "  Ambiente dinâmico: x → %d; y → %d\n\n" x y

let z = (x + y) + (y + 2)
let () = Printf.printf "let z = (x + y) + (y + 2)\n"
let () = Printf.printf "  Ambiente estático: x : int; y : int; z : int\n"
let () = Printf.printf "  Ambiente dinâmico: x → %d; y → %d; z → %d\n\n" x y z

let q = z + 1
let () = Printf.printf "let q = z + 1\n"
let () = Printf.printf "  Ambiente estático: x : int; y : int; z : int; q : int\n"
let () = Printf.printf "  Ambiente dinâmico: x → %d; y → %d; z → %d; q → %d\n\n" x y z q

let abs_of_z = if z < 0 then -z else z
let () = Printf.printf "let abs_of_z = if z < 0 then -z else z\n"
let () = Printf.printf "  Ambiente estático: ...; abs_of_z : int\n"
let () = Printf.printf "  Ambiente dinâmico: ...; abs_of_z → %d\n\n" abs_of_z

let abs_of_z_simpler = Int.abs z
let () = Printf.printf "let abs_of_z_simpler = Int.abs z\n"
let () = Printf.printf "  Ambiente estático: ...; abs_of_z_simpler : int\n"
let () = Printf.printf "  Ambiente dinâmico: ...; abs_of_z_simpler → %d\n\n" abs_of_z_simpler

let () = Printf.printf "\n========================================\n"
let () = Printf.printf "DIFERENÇA ENTRE AMBIENTES:\n"
let () = Printf.printf "========================================\n\n"

let () = Printf.printf "AMBIENTE ESTÁTICO (compile-time):\n"
let () = Printf.printf "  - Verificação de tipos feita na compilação\n"
let () = Printf.printf "  - Associação de identificadores a tipos\n"
let () = Printf.printf "  - Exemplo: x : int, f : int -> bool\n\n"

let () = Printf.printf "AMBIENTE DINÂMICO (runtime):\n"
let () = Printf.printf "  - Valores resultantes da avaliação\n"
let () = Printf.printf "  - Associação de identificadores a valores\n"
let () = Printf.printf "  - Exemplo: x → 42, f → <fun>\n\n"

let () = Printf.printf "RELAÇÃO:\n"
let () = Printf.printf "  - Tipos (estático) garantem segurança\n"
let () = Printf.printf "  - Valores (dinâmico) resultam da execução\n"
let () = Printf.printf "  - Um valor de tipo T sempre satisfaz ambiente estático\n\n"

(* ============================================================================ *)
let () = Printf.printf "\n========================================\n"
let () = Printf.printf "FIM DA FOLHA DE EXERCÍCIOS 1\n"
let () = Printf.printf "========================================\n\n"