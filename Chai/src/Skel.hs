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
  Abs.Program topdefs -> failure x

transTopDef :: Abs.TopDef -> Result
transTopDef x = case x of
  Abs.TopDefPredeal handpredeals -> failure x
  Abs.Final expr -> failure x
  Abs.TopDefShape shapedef -> failure x
  Abs.TopDefEval ident evalvals -> failure x

transHandPredeal :: Abs.HandPredeal -> Result
transHandPredeal x = case x of
  Abs.HandPredeal hand handfeature -> failure x

transHandFeature :: Abs.HandFeature -> Result
transHandFeature x = case x of
  Abs.HandLit string -> failure x
  Abs.SmartStackShape ident -> failure x
  Abs.SmartStackFull ident1 ident2 value -> failure x

transValue :: Abs.Value -> Result
transValue x = case x of
  Abs.ValueRange integer1 integer2 -> failure x

transShapeDef :: Abs.ShapeDef -> Result
transShapeDef x = case x of
  Abs.ShapeCond ident shapeexpr -> failure x
  Abs.ShapeLit ident shapes -> failure x

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

transType :: Abs.Type -> Result
transType x = case x of
  Abs.Int -> failure x

transExpr :: Abs.Expr -> Result
transExpr x = case x of
  Abs.HandAttr hand ident -> failure x
  Abs.ELitInt integer -> failure x
  Abs.ELitTrue -> failure x
  Abs.ELitFalse -> failure x
  Abs.ENot expr -> failure x
  Abs.ERel expr1 relop expr2 -> failure x
  Abs.EAnd expr1 expr2 -> failure x
  Abs.EOr expr1 expr2 -> failure x

transHand :: Abs.Hand -> Result
transHand x = case x of
  Abs.HandN -> failure x
  Abs.HandE -> failure x
  Abs.HandW -> failure x
  Abs.HandS -> failure x

transShapeExpr :: Abs.ShapeExpr -> Result
transShapeExpr x = case x of
  Abs.ESuit suitlit -> failure x
  Abs.EShapeInt integer -> failure x
  Abs.ENotShape shapeexpr -> failure x
  Abs.ERelShape shapeexpr1 relop shapeexpr2 -> failure x
  Abs.EAndShape shapeexpr1 shapeexpr2 -> failure x
  Abs.EOrShape shapeexpr1 shapeexpr2 -> failure x

transSuitLit :: Abs.SuitLit -> Result
transSuitLit x = case x of
  Abs.SuitLitS -> failure x
  Abs.SuitLitH -> failure x
  Abs.SuitLitD -> failure x
  Abs.SuitLitC -> failure x

transRelOp :: Abs.RelOp -> Result
transRelOp x = case x of
  Abs.LTH -> failure x
  Abs.LE -> failure x
  Abs.GTH -> failure x
  Abs.GE -> failure x
  Abs.EQU -> failure x
  Abs.NE -> failure x
