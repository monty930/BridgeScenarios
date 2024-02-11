-- File generated by the BNF Converter (bnfc 2.9.4.1).

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language bridgechai.

module Abs where

import Prelude (Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data Prog = Program [TopDef]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data TopDef = TopDefPredeal [HandPredeal] | Final Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data HandPredeal = HandPredeal Hand HandFeature
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data HandFeature
    = HandLit String
    | SmartStackShape Ident
    | SmartStackFull Ident Ident Value
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Value = ValueRange Integer Integer
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ShapeDef = ShapeCond Ident ShapeExpr | ShapeLit Ident [Shape]
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

data Type = Int
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Expr
    = HandAttr Hand Ident
    | ELitInt Integer
    | ELitTrue
    | ELitFalse
    | ENot Expr
    | ERel Expr RelOp Expr
    | EAnd Expr Expr
    | EOr Expr Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Hand = HandN | HandE | HandW | HandS
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data ShapeExpr
    = ESuit SuitLit
    | EShapeInt Integer
    | ENotShape ShapeExpr
    | ERelShape ShapeExpr RelOp ShapeExpr
    | EAndShape ShapeExpr ShapeExpr
    | EOrShape ShapeExpr ShapeExpr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data SuitLit = SuitLitS | SuitLitH | SuitLitD | SuitLitC
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data RelOp = LTH | LE | GTH | GE | EQU | NE
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

