# Coal-Repo

x86 MASM (`Irvine32`) assembly programs for **Computer Organization & Assembly Language (COAL)** — lab exercises, quiz prep/tasks, assignment questions (`Q1.asm`–`Q10.asm`), and midterm tasks.

## Contents

- **Lab & Practice Tasks**: `source.asm`, `boilerplate.asm`, `lab 4.asm`, `check vowels 1.asm`, `check vowels 2.asm`, `FindMin.asm`, `morethen20.asm`, `small to capital.asm`, `reverse string via stack.asm`
- **Quiz Prep & Quizzes**: `quiz prep 1.asm`–`quiz prep 3.asm`, `quiz lab task.asm`, `Question 1.asm`, `Q1 quiz.asm`, `Q2 quiz.asm`
- **Assignment Questions**: `Q1.asm`–`Q10.asm`
- **Midterm Task**: `mid task.asm`

## Running in Visual Studio

1. Ensure the **Irvine32** library is installed at `C:\Irvine` (`Irvine32.inc` and `Irvine32.lib`).
2. Open `ConsoleApplication2.slnx` in Visual Studio and select the **`Debug | x86` (`Win32`)** configuration.
3. Because only one `main` entrypoint can be built at a time, right-click the `.asm` file you want to run → **Properties → General → Excluded From Build → No** (and set **Yes** on the other `.asm` files).
4. Build and run (`Ctrl + F5`).
