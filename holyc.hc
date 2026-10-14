U0 Calc()
{
  U8 *s;
  F64 a, b, res = 0;
  U8 op;
  Bool ok;

  "HolyC Calculator\n";
  "Операции: + - * / ^   (q - выход)\n\n";

  while (TRUE) {
    s = GetStr("Первое число (q - выход): ");
    if (!StrCmp(s, "q")) {
      Free(s);
      break;
    }
    a = Str2F64(s);
    Free(s);

    s = GetStr("Операция (+ - * / ^): ");
    op = s[0];
    Free(s);

    s = GetStr("Второе число: ");
    b = Str2F64(s);
    Free(s);

    ok = TRUE;
    switch (op) {
      case '+': res = a + b; break;
      case '-': res = a - b; break;
      case '*': res = a * b; break;
      case '/':
        if (b == 0) {
          "Ошибка: деление на ноль\n\n";
          ok = FALSE;
        } else
          res = a / b;
        break;
      case '^': res = Pow(a, b); break;
      default:
        "Неизвестная операция\n\n";
        ok = FALSE;
    }

    if (ok)
      "Результат: %g\n\n", res;
  }
  "Пока!\n";
}

Calc;