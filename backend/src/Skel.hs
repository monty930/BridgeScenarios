-- File generated by the BNF Converter (bnfc 2.9.4.1).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Abs.Ident -> Result
transIdent x = case x of
  Abs.Ident string -> failure x

transProg :: Abs.Prog -> Result
transProg x = case x of
  Abs.EmptyProg defs -> failure x
  Abs.Program defs expr -> failure x

transDef :: Abs.Def -> Result
transDef x = case x of
  Abs.TopDefShape shapedef -> failure x
  Abs.TopDefEval evaldef -> failure x

transType :: Abs.Type -> Result
transType x = case x of
  Abs.Int -> failure x

transShapeDef :: Abs.ShapeDef -> Result
transShapeDef x = case x of
  Abs.ShapeDef ident shapes -> failure x

transEvalDef :: Abs.EvalDef -> Result
transEvalDef x = case x of
  Abs.EvalDef ident evalvals -> failure x

transEvalVal :: Abs.EvalVal -> Result
transEvalVal x = case x of
  Abs.EvalVal integer -> failure x

transShape :: Abs.Shape -> Result
transShape x = case x of
  Abs.ShapeOk shapeok -> failure x
  Abs.ShapeNeg shapeneg -> failure x

transShapeOk :: Abs.ShapeOk -> Result
transShapeOk x = case x of
  Abs.OneShapeOk suitcounts -> failure x

transShapeNeg :: Abs.ShapeNeg -> Result
transShapeNeg x = case x of
  Abs.OneShapeNeg shapeok -> failure x

transSuitCount :: Abs.SuitCount -> Result
transSuitCount x = case x of
  Abs.SuitIntCount suitint -> failure x
  Abs.SuitChoice suitints -> failure x

transSuitInt :: Abs.SuitInt -> Result
transSuitInt x = case x of
  Abs.SuitInt integer -> failure x

transExpr :: Abs.Expr -> Result
transExpr x = case x of
  Abs.HandAttr hand attr -> failure x
  Abs.ELitInt integer -> failure x
  Abs.ELitTrue -> failure x
  Abs.ELitFalse -> failure x
  Abs.Not expr -> failure x
  Abs.ERel expr1 relop expr2 -> failure x
  Abs.EAnd expr1 expr2 -> failure x
  Abs.EOr expr1 expr2 -> failure x

transHand :: Abs.Hand -> Result
transHand x = case x of
  Abs.HandN -> failure x
  Abs.HandE -> failure x
  Abs.HandW -> failure x
  Abs.HandS -> failure x

transLenAttr :: Abs.LenAttr -> Result
transLenAttr x = case x of
  Abs.AttrSpades -> failure x
  Abs.AttrHearts -> failure x
  Abs.AttrDiams -> failure x
  Abs.AttrClubs -> failure x

transSimpAttr :: Abs.SimpAttr -> Result
transSimpAttr x = case x of
  Abs.AttrHcp -> failure x

transAttr :: Abs.Attr -> Result
transAttr x = case x of
  Abs.AttrVar ident -> failure x
  Abs.LenAttr lenattr -> failure x
  Abs.SimpAttr simpattr -> failure x

transRelOp :: Abs.RelOp -> Result
transRelOp x = case x of
  Abs.LTH -> failure x
  Abs.LE -> failure x
  Abs.GTH -> failure x
  Abs.GE -> failure x
  Abs.EQU -> failure x
  Abs.NE -> failure x
