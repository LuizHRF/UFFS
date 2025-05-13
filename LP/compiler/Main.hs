module Main where

import Lexer
import Parser
import Interpreter
import TypeChecker

-- OU, ==, *, -, >=, NOT

main = getContents >>= print . eval . typecheck . parser .lexer