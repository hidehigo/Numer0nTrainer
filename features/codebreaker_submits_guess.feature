Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers.  The game marks the guess
  with "eat" and "bite" signs.

  For each number in the guess that matches the number and position of a number
  in the secret code, the mark includes "eat" sign. For each number in the guess
  that matches the number but not the position of a number in the secret code,
  the mark includes "bite" sign.

  Each position in the secret code can only be matched once.  For example, a
  guess of 1134 against a secret code of 1234 would get three plus signs: one
  for each of the exact matches in the first, third and fourth positions.  The
  number match in the second position would be ignored.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Scenarios: no matches
      | code | guess | mark |
      | 123  | 567   | 00   |

    Scenarios: 1 number correct
      | code | guess | mark |
      | 123  | 156   | 10   |
      | 123  | 256   | 01   |

    Scenarios: 2 numbers correct
      | code | guess | mark |
      | 123  | 523   | 20   |
      | 123  | 513   | 11   |
      | 123  | 251   | 02   |

    Scenarios: all numbers correct
      | code | guess | mark |
      | 123  | 123   | 30   |

