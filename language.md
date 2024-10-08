# Дизайн языка ReAsm

## Ключевые слова

ключевое слово основых инструкций - main
ключевое слово для объявления блока инструкций - define
ключевое слово для прыжка между блоками инструкций - jump
*/ ключевое слово для сискалов - syscall
ключевое слово для сравнений (if) - check

ключевые слова для памяти такие же как в assembly - NASM (mov, ...)
замена mov на move

## Заметки

Виртуализация памяти будет косвенной и в текущем состоянии плохо спроектирована. Основная задумка - дать *полный* контроль над **виртуальной** памятью. Под термином **виртуальная** память подразумевается определенный участок памяти регистров с известным размером, безопасность и оптимизация которого обрабатывается компилятором.

Планируется создать стандартную библиотеку, которая будет включать в себя блоки инструкций на нашем языке. К ним можно будет обращаться по названию. Сама стандартная библиотека будет в основном состоять из стандартных функций языка С (си), которые были переписаны на наш язык. Т.е. стандартная библиотека расширит основной функционал языка, будет опциональной для использования и позволит расширить управление памяти до heap.

## Основная идея

- Обеспечить программистический сахар для работы с ассемблером, сохраняя его основные фишки
- Предоставить кросс-компиляцию одного и того же кода для разных платформ
- Обеспечить безопасную работу с памятью, т.е. для каждого блока инструкций будет *виртуальная* память,

> [!NOTE]
> Обеспечить язык мощным компилятором на основе LLVM.
> Важна не скорость компиляции, а скорость работы бинаря и его маленькие размеры.

### Our WIP language equivalent

```
main {    helloworld

  
    move eax, 1     ; Обязательство писать эти строки делает код небезопасным
    move ebx, 0     ; Сделать так, чтобы компилятор сам подставлял эти строчки
    syscall         ; И не разрешал работать с памятью в main. 

}  

define helloworld { 
    .data 512 {                         ; Объявление виртуальной памяти размером 512 байт
        hello: db 'hello, world!',10
        helloLen: equ $-hello
    }
    .code {
        move edx, helloLen
        move ecx, hello

        move eax, 4
        move ebx, 1
        syscall
    }
}
```

### NASM assembler equivalent

```nasm
section .data
    msg: db "hello world", 0Ah
    helloLen: equ $-msg

section .text
    global _start

_start:
    mov edx, helloLen
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 80h

```

### Литература и информация

- [Информация о NASM](https://en.wikipedia.org/wiki/Netwide_Assembler)
- [Обучение NASM](https://asmtutor.com/)
- [Создание компилятора](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/index.html)
- [Шпаргалка asm](https://eax.me/assembler-basics/)
