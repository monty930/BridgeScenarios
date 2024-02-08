-- File generated by the BNF Converter (bnfc 2.9.4.1).

-- | The abstract syntax of language bridgelatte.

module Bridgelatte.Abs where

import Prelude (Integer)
import qualified Prelude as C (Eq, Ord, Show, Read)

data Prog = Program Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Type = Int
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Expr
    = EVar Hand Attr
    | ELitInt Integer
    | ELitTrue
    | ELitFalse
    | Not Expr
    | ERel Expr RelOp Expr
    | EAnd Expr Expr
    | EOr Expr Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Hand = HandN | HandE | HandW | HandS
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data LenAttr = AttrSpades | AttrHearts | AttrDiams | AttrClubs
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data SimpAttr = AttrHcp
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Attr = LenAttr LenAttr | SimpAttr SimpAttr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data RelOp = LTH | LE | GTH | GE | EQU | NE
  deriving (C.Eq, C.Ord, C.Show, C.Read)

