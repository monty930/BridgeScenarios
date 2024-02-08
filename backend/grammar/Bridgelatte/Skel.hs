-- File generated by the BNF Converter (bnfc 2.9.4.1).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Bridgelatte.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Bridgelatte.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transProg :: Bridgelatte.Abs.Prog -> Result
transProg x = case x of
  Bridgelatte.Abs.Program expr -> failure x

transType :: Bridgelatte.Abs.Type -> Result
transType x = case x of
  Bridgelatte.Abs.Int -> failure x

transExpr :: Bridgelatte.Abs.Expr -> Result
transExpr x = case x of
  Bridgelatte.Abs.EVar hand attr -> failure x
  Bridgelatte.Abs.ELitInt integer -> failure x
  Bridgelatte.Abs.ELitTrue -> failure x
  Bridgelatte.Abs.ELitFalse -> failure x
  Bridgelatte.Abs.Not expr -> failure x
  Bridgelatte.Abs.ERel expr1 relop expr2 -> failure x
  Bridgelatte.Abs.EAnd expr1 expr2 -> failure x
  Bridgelatte.Abs.EOr expr1 expr2 -> failure x

transHand :: Bridgelatte.Abs.Hand -> Result
transHand x = case x of
  Bridgelatte.Abs.HandN -> failure x
  Bridgelatte.Abs.HandE -> failure x
  Bridgelatte.Abs.HandW -> failure x
  Bridgelatte.Abs.HandS -> failure x

transLenAttr :: Bridgelatte.Abs.LenAttr -> Result
transLenAttr x = case x of
  Bridgelatte.Abs.AttrSpades -> failure x
  Bridgelatte.Abs.AttrHearts -> failure x
  Bridgelatte.Abs.AttrDiams -> failure x
  Bridgelatte.Abs.AttrClubs -> failure x

transSimpAttr :: Bridgelatte.Abs.SimpAttr -> Result
transSimpAttr x = case x of
  Bridgelatte.Abs.AttrHcp -> failure x

transAttr :: Bridgelatte.Abs.Attr -> Result
transAttr x = case x of
  Bridgelatte.Abs.LenAttr lenattr -> failure x
  Bridgelatte.Abs.SimpAttr simpattr -> failure x

transRelOp :: Bridgelatte.Abs.RelOp -> Result
transRelOp x = case x of
  Bridgelatte.Abs.LTH -> failure x
  Bridgelatte.Abs.LE -> failure x
  Bridgelatte.Abs.GTH -> failure x
  Bridgelatte.Abs.GE -> failure x
  Bridgelatte.Abs.EQU -> failure x
  Bridgelatte.Abs.NE -> failure x
