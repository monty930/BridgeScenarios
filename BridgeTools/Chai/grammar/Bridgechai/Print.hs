-- File generated by the BNF Converter (bnfc 2.9.4.1).

{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif

-- | Pretty-printer for Bridgechai.

module Bridgechai.Print where

import Prelude
  ( ($), (.)
  , Bool(..), (==), (<)
  , Int, Integer, Double, (+), (-), (*)
  , String, (++)
  , ShowS, showChar, showString
  , all, elem, foldr, id, map, null, replicate, shows, span
  )
import Data.Char ( Char, isSpace )
import qualified Bridgechai.Abs

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 False (map ($ "") $ d []) ""
  where
  rend
    :: Int        -- ^ Indentation level.
    -> Bool       -- ^ Pending indentation to be output before next character?
    -> [String]
    -> ShowS
  rend i p = \case
      "["      :ts -> char '[' . rend i False ts
      "("      :ts -> char '(' . rend i False ts
      "{"      :ts -> onNewLine i     p . showChar   '{'  . new (i+1) ts
      "}" : ";":ts -> onNewLine (i-1) p . showString "};" . new (i-1) ts
      "}"      :ts -> onNewLine (i-1) p . showChar   '}'  . new (i-1) ts
      [";"]        -> char ';'
      ";"      :ts -> char ';' . new i ts
      t  : ts@(s:_) | closingOrPunctuation s
                   -> pending . showString t . rend i False ts
      t        :ts -> pending . space t      . rend i False ts
      []           -> id
    where
    -- Output character after pending indentation.
    char :: Char -> ShowS
    char c = pending . showChar c

    -- Output pending indentation.
    pending :: ShowS
    pending = if p then indent i else id

  -- Indentation (spaces) for given indentation level.
  indent :: Int -> ShowS
  indent i = replicateS (2*i) (showChar ' ')

  -- Continue rendering in new line with new indentation.
  new :: Int -> [String] -> ShowS
  new j ts = showChar '\n' . rend j True ts

  -- Make sure we are on a fresh line.
  onNewLine :: Int -> Bool -> ShowS
  onNewLine i p = (if p then id else showChar '\n') . indent i

  -- Separate given string from following text by a space (if needed).
  space :: String -> ShowS
  space t s =
    case (all isSpace t', null spc, null rest) of
      (True , _   , True ) -> []              -- remove trailing space
      (False, _   , True ) -> t'              -- remove trailing space
      (False, True, False) -> t' ++ ' ' : s   -- add space if none
      _                    -> t' ++ s
    where
      t'          = showString t []
      (spc, rest) = span isSpace s

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt i = concatD . map (prt i)

instance Print Char where
  prt _ c = doc (showChar '\'' . mkEsc '\'' c . showChar '\'')

instance Print String where
  prt _ = printString

printString :: String -> Doc
printString s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q = \case
  s | s == q -> showChar '\\' . showChar s
  '\\' -> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  s -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Bridgechai.Abs.Ident where
  prt _ (Bridgechai.Abs.Ident i) = doc $ showString i
instance Print (Bridgechai.Abs.Prog' a) where
  prt i = \case
    Bridgechai.Abs.Program _ topdefs -> prPrec i 0 (concatD [prt 0 topdefs])

instance Print (Bridgechai.Abs.TopDef' a) where
  prt i = \case
    Bridgechai.Abs.TopDefPredeal _ handpredeals -> prPrec i 0 (concatD [doc (showString "predeal"), doc (showString "="), doc (showString "{"), prt 0 handpredeals, doc (showString "}")])
    Bridgechai.Abs.Final _ expr -> prPrec i 0 (concatD [doc (showString "final"), doc (showString "="), prt 0 expr])
    Bridgechai.Abs.TopDefShape _ shapedef -> prPrec i 0 (concatD [prt 0 shapedef])
    Bridgechai.Abs.TopDefEval _ id_ evalvals -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), doc (showString "evaluator"), doc (showString "("), prt 0 evalvals, doc (showString ")")])
    Bridgechai.Abs.TopDefHold _ id_ holdingexpr -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), doc (showString "holding("), prt 0 holdingexpr, doc (showString ")")])

instance Print [Bridgechai.Abs.TopDef' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Bridgechai.Abs.HandPredeal' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print (Bridgechai.Abs.HandPredeal' a) where
  prt i = \case
    Bridgechai.Abs.HandPredeal _ hand handfeature -> prPrec i 0 (concatD [prt 0 hand, doc (showString ":"), prt 0 handfeature])

instance Print (Bridgechai.Abs.HandFeature' a) where
  prt i = \case
    Bridgechai.Abs.HandLit _ str -> prPrec i 0 (concatD [printString str])
    Bridgechai.Abs.SmartStackShape _ id_ -> prPrec i 0 (concatD [doc (showString "("), prt 0 id_, doc (showString ")")])
    Bridgechai.Abs.SmartStackFunc _ id_1 id_2 n -> prPrec i 0 (concatD [doc (showString "("), prt 0 id_1, doc (showString ","), prt 0 id_2, doc (showString ","), prt 0 n, doc (showString ")")])
    Bridgechai.Abs.SmartStackFull _ id_1 id_2 value -> prPrec i 0 (concatD [doc (showString "("), prt 0 id_1, doc (showString ","), prt 0 id_2, doc (showString ","), prt 0 value, doc (showString ")")])

instance Print (Bridgechai.Abs.Value' a) where
  prt i = \case
    Bridgechai.Abs.ValueRange _ n1 n2 -> prPrec i 0 (concatD [doc (showString "("), prt 0 n1, doc (showString ","), prt 0 n2, doc (showString ")")])

instance Print (Bridgechai.Abs.ShapeDef' a) where
  prt i = \case
    Bridgechai.Abs.ShapeCond _ id_ shapeexpr -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), doc (showString "("), prt 0 shapeexpr, doc (showString ")")])
    Bridgechai.Abs.ShapeLit _ id_ shapes -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), prt 0 shapes])

instance Print (Bridgechai.Abs.EvalVal' a) where
  prt i = \case
    Bridgechai.Abs.EvalVal _ n -> prPrec i 0 (concatD [prt 0 n])

instance Print [Bridgechai.Abs.EvalVal' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print (Bridgechai.Abs.Shape' a) where
  prt i = \case
    Bridgechai.Abs.ShapeOk _ shapeok -> prPrec i 0 (concatD [prt 0 shapeok])
    Bridgechai.Abs.ShapeNeg _ shapeneg -> prPrec i 0 (concatD [prt 0 shapeneg])

instance Print (Bridgechai.Abs.ShapeOk' a) where
  prt i = \case
    Bridgechai.Abs.OneShapeOk _ suitcounts -> prPrec i 0 (concatD [doc (showString "["), prt 0 suitcounts, doc (showString "]")])

instance Print (Bridgechai.Abs.ShapeNeg' a) where
  prt i = \case
    Bridgechai.Abs.OneShapeNeg _ shapeok -> prPrec i 0 (concatD [doc (showString "!"), prt 0 shapeok])

instance Print [Bridgechai.Abs.Shape' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString "+"), prt 0 xs]

instance Print (Bridgechai.Abs.SuitCount' a) where
  prt i = \case
    Bridgechai.Abs.SuitIntCount _ suitint -> prPrec i 0 (concatD [prt 0 suitint])
    Bridgechai.Abs.SuitChoice _ suitints -> prPrec i 0 (concatD [doc (showString "("), prt 0 suitints, doc (showString ")")])

instance Print (Bridgechai.Abs.SuitInt' a) where
  prt i = \case
    Bridgechai.Abs.SuitInt _ n -> prPrec i 0 (concatD [prt 0 n])

instance Print [Bridgechai.Abs.SuitCount' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Bridgechai.Abs.SuitInt' a] where
  prt _ [] = concatD []
  prt _ [x] = concatD [prt 0 x]
  prt _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print (Bridgechai.Abs.Type' a) where
  prt i = \case
    Bridgechai.Abs.Int _ -> prPrec i 0 (concatD [doc (showString "int")])

instance Print (Bridgechai.Abs.Expr' a) where
  prt i = \case
    Bridgechai.Abs.HandAttr _ hand id_ -> prPrec i 6 (concatD [prt 0 hand, doc (showString "."), prt 0 id_])
    Bridgechai.Abs.ELitInt _ n -> prPrec i 6 (concatD [prt 0 n])
    Bridgechai.Abs.ELitTrue _ -> prPrec i 6 (concatD [doc (showString "true")])
    Bridgechai.Abs.ELitFalse _ -> prPrec i 6 (concatD [doc (showString "false")])
    Bridgechai.Abs.ENot _ expr -> prPrec i 5 (concatD [doc (showString "not"), prt 6 expr])
    Bridgechai.Abs.ERel _ expr1 relop expr2 -> prPrec i 2 (concatD [prt 2 expr1, prt 0 relop, prt 3 expr2])
    Bridgechai.Abs.EAnd _ expr1 expr2 -> prPrec i 1 (concatD [prt 2 expr1, doc (showString "and"), prt 1 expr2])
    Bridgechai.Abs.EOr _ expr1 expr2 -> prPrec i 0 (concatD [prt 1 expr1, doc (showString "or"), prt 0 expr2])

instance Print (Bridgechai.Abs.Hand' a) where
  prt i = \case
    Bridgechai.Abs.HandN _ -> prPrec i 0 (concatD [doc (showString "N")])
    Bridgechai.Abs.HandE _ -> prPrec i 0 (concatD [doc (showString "E")])
    Bridgechai.Abs.HandW _ -> prPrec i 0 (concatD [doc (showString "W")])
    Bridgechai.Abs.HandS _ -> prPrec i 0 (concatD [doc (showString "S")])

instance Print (Bridgechai.Abs.ShapeExpr' a) where
  prt i = \case
    Bridgechai.Abs.ESuit _ suitlit -> prPrec i 6 (concatD [prt 0 suitlit])
    Bridgechai.Abs.EShapeInt _ n -> prPrec i 6 (concatD [prt 0 n])
    Bridgechai.Abs.ENotShape _ shapeexpr -> prPrec i 5 (concatD [doc (showString "not"), prt 6 shapeexpr])
    Bridgechai.Abs.ERelShape _ shapeexpr1 relop shapeexpr2 -> prPrec i 2 (concatD [prt 2 shapeexpr1, prt 0 relop, prt 3 shapeexpr2])
    Bridgechai.Abs.EAndShape _ shapeexpr1 shapeexpr2 -> prPrec i 1 (concatD [prt 2 shapeexpr1, doc (showString "and"), prt 1 shapeexpr2])
    Bridgechai.Abs.EOrShape _ shapeexpr1 shapeexpr2 -> prPrec i 0 (concatD [prt 1 shapeexpr1, doc (showString "or"), prt 0 shapeexpr2])

instance Print (Bridgechai.Abs.SuitLit' a) where
  prt i = \case
    Bridgechai.Abs.SuitLitS _ -> prPrec i 0 (concatD [doc (showString "s")])
    Bridgechai.Abs.SuitLitH _ -> prPrec i 0 (concatD [doc (showString "h")])
    Bridgechai.Abs.SuitLitD _ -> prPrec i 0 (concatD [doc (showString "d")])
    Bridgechai.Abs.SuitLitC _ -> prPrec i 0 (concatD [doc (showString "c")])

instance Print (Bridgechai.Abs.HoldingExpr' a) where
  prt i = \case
    Bridgechai.Abs.HExprLen _ -> prPrec i 5 (concatD [doc (showString "length")])
    Bridgechai.Abs.HExprInt _ n -> prPrec i 5 (concatD [prt 0 n])
    Bridgechai.Abs.HExprCard _ card -> prPrec i 5 (concatD [prt 0 card])
    Bridgechai.Abs.HNotExpr _ holdingexpr -> prPrec i 4 (concatD [doc (showString "not"), prt 5 holdingexpr])
    Bridgechai.Abs.HRelExpr _ holdingexpr1 relop holdingexpr2 -> prPrec i 2 (concatD [prt 2 holdingexpr1, prt 0 relop, prt 3 holdingexpr2])
    Bridgechai.Abs.HAndExpr _ holdingexpr1 holdingexpr2 -> prPrec i 1 (concatD [prt 2 holdingexpr1, doc (showString "and"), prt 1 holdingexpr2])
    Bridgechai.Abs.HOrExpr _ holdingexpr1 holdingexpr2 -> prPrec i 0 (concatD [prt 1 holdingexpr1, doc (showString "or"), prt 0 holdingexpr2])

instance Print (Bridgechai.Abs.Card' a) where
  prt i = \case
    Bridgechai.Abs.CardA _ -> prPrec i 0 (concatD [doc (showString "[A]")])
    Bridgechai.Abs.CardK _ -> prPrec i 0 (concatD [doc (showString "[K]")])
    Bridgechai.Abs.CardQ _ -> prPrec i 0 (concatD [doc (showString "[Q]")])
    Bridgechai.Abs.CardJ _ -> prPrec i 0 (concatD [doc (showString "[J]")])
    Bridgechai.Abs.CardT _ -> prPrec i 0 (concatD [doc (showString "[T]")])
    Bridgechai.Abs.Card9 _ -> prPrec i 0 (concatD [doc (showString "[9]")])
    Bridgechai.Abs.Card8 _ -> prPrec i 0 (concatD [doc (showString "[8]")])
    Bridgechai.Abs.Card7 _ -> prPrec i 0 (concatD [doc (showString "[7]")])
    Bridgechai.Abs.Card6 _ -> prPrec i 0 (concatD [doc (showString "[6]")])
    Bridgechai.Abs.Card5 _ -> prPrec i 0 (concatD [doc (showString "[5]")])
    Bridgechai.Abs.Card4 _ -> prPrec i 0 (concatD [doc (showString "[4]")])
    Bridgechai.Abs.Card3 _ -> prPrec i 0 (concatD [doc (showString "[3]")])
    Bridgechai.Abs.Card2 _ -> prPrec i 0 (concatD [doc (showString "[2]")])

instance Print (Bridgechai.Abs.RelOp' a) where
  prt i = \case
    Bridgechai.Abs.LTH _ -> prPrec i 0 (concatD [doc (showString "<")])
    Bridgechai.Abs.LE _ -> prPrec i 0 (concatD [doc (showString "<=")])
    Bridgechai.Abs.GTH _ -> prPrec i 0 (concatD [doc (showString ">")])
    Bridgechai.Abs.GE _ -> prPrec i 0 (concatD [doc (showString ">=")])
    Bridgechai.Abs.EQU _ -> prPrec i 0 (concatD [doc (showString "==")])
    Bridgechai.Abs.NE _ -> prPrec i 0 (concatD [doc (showString "!=")])
