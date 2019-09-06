# Infraestrutura de Hardware: MIPS Exercise List

## 1. Implemente o Algoritmo [Bubblesort](https://www.geeksforgeeks.org/bubble-sort/)

## 2. Implemente um Programa que Indentifique [Palíndromos](https://www.geeksforgeeks.org/c-program-check-given-string-palindrome/)

Dado o seguinte código em (pseudo) `C`, implemente um programa equivalente em `MIPS`

```C
    int checkStr(int len, char* str) {
        int result = 1;
        for(int i = 0, j=len-1; i < j; i++, j--) {
            if (str[i] != str[j]) {
                result = 0;
                break;
            }
        }

        return result;
    }
```

## 3. Implemente um Programa que Inverta Strings (c/ inversão de maiusculização)

Para essa questão, recomenda-se que sejam usadas variáveis do tipo `ASCIIZ`.

* **entrada**: `string` com `n` caracteres

* **saída**: uma nova `string` com `n` caracteres
    1. deve ser a inversão da ordem dos caracteres da `string` de `entrada`
    2. deve ser a inversão de letras maiúsculas por minúsculas, e vice-versa, da `string` de `entrada`

* **Exemplo**: se a entrada for `HArdwArE`, a saída deverá ser `eRaWDRah`.

* **requisitos**:
    1. a entrada deve ser `lida da memória`
    2. a saída deve ser `escrita na memória`
    3. o fim da `string` é dado pelo `caractere nulo` (`\0`)
    4. os `caracteres` deverão ser armazenados em sequência na memória

* **exceções**
    1. caso a `string` possua algum `caractere` que não seja `letra`, o valor `1` deverá ser armazenado no registrador `v1` **e** o programa deverá ser encerrado.

## 4. Implemente um Programa que Faça uma [Análise Combinatória](https://www.geeksforgeeks.org/print-all-possible-combinations-of-r-elements-in-a-given-array-of-size-n/)

* **entrada**: dois `números` `n`​ e `​C`​

* **saída**: o resultado da combinação de `​n​` tomados ​`s`​ a `s`​

* **requisitos**
    1. a entrada deve ser `lida da memória`
    2. a saída deve ser `escrita na memória`
    3. os números `​n`​ e `​s`​ devem ser carregados da memória
    4. o resultado da combinação deve ser colocado na mesma em uma variável COMB

* **requisitos**
    1. é obrigatório o uso de recursão para o cálculo do fatorial

* **exceções**
    1. caso ​`s` ​​seja maior que​​ `n`​, deve, o ​valor `1​` deve ser armazenado no ​registrador​​ `v1`
    2. caso `​n` e/ou `s` seja menor que `zero​`, o valor `2`​ deve ser armazenado no​ registrador `v1`​
    3. caso `​n` seja igual a `s`​, o ​valor `3`​ deve ser armazenado no ​registrador `v1`​
    4. caso `​n` e/ou `s` seja igual a `zero​`, o ​valor `4`​ deve ser armazenado no ​registrador `v1​`

## 5. Implemente um Programa que Faça a Somatória de um Array

* **entrada**: Array com `n` caracteres
    2. os `elementos` do array devem ser `inteiros de 8 bits`

* **saída**: a `soma` de todos os elementos do `array`

* **requisitos**:
    1. a entrada deve ser `lida da memória`
    2. a saída deve ser `escrita na memória`
