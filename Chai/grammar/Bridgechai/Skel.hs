-- File generated by the BNF Converter (bnfc 2.9.4.1).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Bridgechai.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Bridgechai.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Bridgechai.Abs.Ident -> Result
transIdent x = case x of
  Bridgechai.Abs.Ident string -> failure x

transProg :: Bridgechai.Abs.Prog -> Result
transProg x = case x of
  Bridgechai.Abs.Program topdefs -> failure x

transTopDef :: Bridgechai.Abs.TopDef -> Result
transTopDef x = case x of
  Bridgechai.Abs.TopDefPredeal handpredeals -> failure x
  Bridgechai.Abs.Final expr -> failure x
  Bridgechai.Abs.TopDefShape shapedef -> failure x
  Bridgechai.Abs.TopDefEval ident evalvals -> failure x

transHandPredeal :: Bridgechai.Abs.HandPredeal -> Result
transHandPredeal x = case x of
  Bridgechai.Abs.HandPredeal hand handfeature -> failure x

transHandFeature :: Bridgechai.Abs.HandFeature -> Result
transHandFeature x = case x of
  Bridgechai.Abs.HandLit string -> failure x
  Bridgechai.Abs.SmartStackShape ident -> failure x
  Bridgechai.Abs.SmartStackFull ident1 ident2 value -> failure x

transValue :: Bridgechai.Abs.Value -> Result
transValue x = case x of
  Bridgechai.Abs.ValueRange integer1 integer2 -> failure x

transShapeDef :: Bridgechai.Abs.ShapeDef -> Result
transShapeDef x = case x of
  Bridgechai.Abs.ShapeCond ident shapeexpr -> failure x
  Bridgechai.Abs.ShapeLit ident shapes -> failure x

transEvalVal :: Bridgechai.Abs.EvalVal -> Result
transEvalVal x = case x of
  Bridgechai.Abs.EvalVal integer -> failure x

transShape :: Bridgechai.Abs.Shape -> Result
transShape x = case x of
  Bridgechai.Abs.ShapeOk shapeok -> failure x
  Bridgechai.Abs.ShapeNeg shapeneg -> failure x

transShapeOk :: Bridgechai.Abs.ShapeOk -> Result
transShapeOk x = case x of
  Bridgechai.Abs.OneShapeOk suitcounts -> failure x

transShapeNeg :: Bridgechai.Abs.ShapeNeg -> Result
transShapeNeg x = case x of
  Bridgechai.Abs.OneShapeNeg shapeok -> failure x

transSuitCount :: Bridgechai.Abs.SuitCount -> Result
transSuitCount x = case x of
  Bridgechai.Abs.SuitIntCount suitint -> failure x
  Bridgechai.Abs.SuitChoice suitints -> failure x

transSuitInt :: Bridgechai.Abs.SuitInt -> Result
transSuitInt x = case x of
  Bridgechai.Abs.SuitInt integer -> failure x

transType :: Bridgechai.Abs.Type -> Result
transType x = case x of
  Bridgechai.Abs.Int -> failure x

transExpr :: Bridgechai.Abs.Expr -> Result
transExpr x = case x of
  Bridgechai.Abs.HandAttr hand ident -> failure x
  Bridgechai.Abs.ELitInt integer -> failure x
  Bridgechai.Abs.ELitTrue -> failure x
  Bridgechai.Abs.ELitFalse -> failure x
  Bridgechai.Abs.ENot expr -> failure x
  Bridgechai.Abs.ERel expr1 relop expr2 -> failure x
  Bridgechai.Abs.EAnd expr1 expr2 -> failure x
  Bridgechai.Abs.EOr expr1 expr2 -> failure x

transHand :: Bridgechai.Abs.Hand -> Result
transHand x = case x of
  Bridgechai.Abs.HandN -> failure x
  Bridgechai.Abs.HandE -> failure x
  Bridgechai.Abs.HandW -> failure x
  Bridgechai.Abs.HandS -> failure x

transShapeExpr :: Bridgechai.Abs.ShapeExpr -> Result
transShapeExpr x = case x of
  Bridgechai.Abs.ESuit suitlit -> failure x
  Bridgechai.Abs.EShapeInt integer -> failure x
  Bridgechai.Abs.ENotShape shapeexpr -> failure x
  Bridgechai.Abs.ERelShape shapeexpr1 relop shapeexpr2 -> failure x
  Bridgechai.Abs.EAndShape shapeexpr1 shapeexpr2 -> failure x
  Bridgechai.Abs.EOrShape shapeexpr1 shapeexpr2 -> failure x

transSuitLit :: Bridgechai.Abs.SuitLit -> Result
transSuitLit x = case x of
  Bridgechai.Abs.SuitLitS -> failure x
  Bridgechai.Abs.SuitLitH -> failure x
  Bridgechai.Abs.SuitLitD -> failure x
  Bridgechai.Abs.SuitLitC -> failure x

transRelOp :: Bridgechai.Abs.RelOp -> Result
transRelOp x = case x of
  Bridgechai.Abs.LTH -> failure x
  Bridgechai.Abs.LE -> failure x
  Bridgechai.Abs.GTH -> failure x
  Bridgechai.Abs.GE -> failure x
  Bridgechai.Abs.EQU -> failure x
  Bridgechai.Abs.NE -> failure x
