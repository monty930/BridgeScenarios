-- File generated by the BNF Converter (bnfc 2.9.4.1).

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language bridgelatte.

module Bridgelatte.Abs where

import Prelude (Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data Prog = EmptyProg [Def] | Program [Def] Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Def = TopDefShape ShapeDef | TopDefEval EvalDef
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Type = Int
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ShapeDef = ShapeDef Ident [Shape]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data EvalDef = EvalDef Ident [EvalVal]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data EvalVal = EvalVal Integer
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Shape = ShapeOk ShapeOk | ShapeNeg ShapeNeg
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ShapeOk = OneShapeOk [SuitCount]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ShapeNeg = OneShapeNeg ShapeOk
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data SuitCount = SuitIntCount SuitInt | SuitChoice [SuitInt]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data SuitInt = SuitInt Integer
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Expr
    = HandAttr Hand Attr
    | HandSimpAttr SimpAttr Hand
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

data SimpAttr = AttrHcp | AttrFreak | AttrLoser
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Attr = AttrVar Ident | LenAttr LenAttr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data RelOp = LTH | LE | GTH | GE | EQU | NE
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

