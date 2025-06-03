{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,396) ([4320,37986,259,0,0,0,49152,63293,1832,0,0,0,0,17280,20872,7182,35906,114,0,0,0,1,33848,58648,0,64,3584,17953,28729,12552,33226,0,0,0,0,40672,54395,3,33040,20,256,49152,63293,1848,0,8,0,18449,64385,20974,14,0,57344,25104,916,4231,7331,33848,58648,8640,10436,3591,17953,28729,12552,33226,34883,3665,29120,20996,36352,36899,2,33040,20,2176,164,18176,1312,14464,10498,50176,18449,17281,20872,14,57344,0,0,0,4231,7331,33848,58648,7168,8311,60933,18361,32827,0,0,0,0,0,0,0,1792,63232,41950,14364,6276,229,2,0,8462,14662,2160,51761,1,0,49152,1905,82,0,7,56432,5249,0,512,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Exp","Type","num","TRUE","FALSE","\"->\"","'+'","'-'","'*'","IF","THEN","ELSE","AND","OR","NOT","'='","\">=\"","\"==\"","var","LAMBDA","':'","NUM","BOOL","'('","')'","LET","IN","WITH","RAISE","TRY","ERROR","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (6) = happyShift action_2
action_0 (7) = happyShift action_4
action_0 (8) = happyShift action_5
action_0 (13) = happyShift action_6
action_0 (18) = happyShift action_7
action_0 (22) = happyShift action_8
action_0 (23) = happyShift action_9
action_0 (27) = happyShift action_10
action_0 (29) = happyShift action_11
action_0 (32) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (34) = happyShift action_14
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (6) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (6) = happyShift action_2
action_3 (7) = happyShift action_4
action_3 (8) = happyShift action_5
action_3 (10) = happyShift action_24
action_3 (11) = happyShift action_25
action_3 (12) = happyShift action_26
action_3 (13) = happyShift action_6
action_3 (16) = happyShift action_27
action_3 (17) = happyShift action_28
action_3 (18) = happyShift action_7
action_3 (20) = happyShift action_29
action_3 (21) = happyShift action_30
action_3 (22) = happyShift action_8
action_3 (23) = happyShift action_9
action_3 (27) = happyShift action_10
action_3 (29) = happyShift action_11
action_3 (32) = happyShift action_12
action_3 (33) = happyShift action_13
action_3 (34) = happyShift action_14
action_3 (35) = happyAccept
action_3 (4) = happyGoto action_23
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_2

action_5 _ = happyReduce_3

action_6 (6) = happyShift action_2
action_6 (7) = happyShift action_4
action_6 (8) = happyShift action_5
action_6 (13) = happyShift action_6
action_6 (18) = happyShift action_7
action_6 (22) = happyShift action_8
action_6 (23) = happyShift action_9
action_6 (27) = happyShift action_10
action_6 (29) = happyShift action_11
action_6 (32) = happyShift action_12
action_6 (33) = happyShift action_13
action_6 (34) = happyShift action_14
action_6 (4) = happyGoto action_22
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (6) = happyShift action_2
action_7 (7) = happyShift action_4
action_7 (8) = happyShift action_5
action_7 (13) = happyShift action_6
action_7 (18) = happyShift action_7
action_7 (22) = happyShift action_8
action_7 (23) = happyShift action_9
action_7 (27) = happyShift action_10
action_7 (29) = happyShift action_11
action_7 (32) = happyShift action_12
action_7 (33) = happyShift action_13
action_7 (34) = happyShift action_14
action_7 (4) = happyGoto action_21
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_15

action_9 (22) = happyShift action_20
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (6) = happyShift action_2
action_10 (7) = happyShift action_4
action_10 (8) = happyShift action_5
action_10 (13) = happyShift action_6
action_10 (18) = happyShift action_7
action_10 (22) = happyShift action_8
action_10 (23) = happyShift action_9
action_10 (27) = happyShift action_10
action_10 (29) = happyShift action_11
action_10 (32) = happyShift action_12
action_10 (33) = happyShift action_13
action_10 (34) = happyShift action_14
action_10 (4) = happyGoto action_19
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (22) = happyShift action_18
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (6) = happyShift action_2
action_12 (7) = happyShift action_4
action_12 (8) = happyShift action_5
action_12 (13) = happyShift action_6
action_12 (18) = happyShift action_7
action_12 (22) = happyShift action_8
action_12 (23) = happyShift action_9
action_12 (27) = happyShift action_10
action_12 (29) = happyShift action_11
action_12 (32) = happyShift action_12
action_12 (33) = happyShift action_13
action_12 (34) = happyShift action_14
action_12 (4) = happyGoto action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (6) = happyShift action_2
action_13 (7) = happyShift action_4
action_13 (8) = happyShift action_5
action_13 (13) = happyShift action_6
action_13 (18) = happyShift action_7
action_13 (22) = happyShift action_8
action_13 (23) = happyShift action_9
action_13 (27) = happyShift action_10
action_13 (29) = happyShift action_11
action_13 (32) = happyShift action_12
action_13 (33) = happyShift action_13
action_13 (34) = happyShift action_14
action_13 (4) = happyGoto action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (6) = happyShift action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_20

action_16 (6) = happyShift action_2
action_16 (7) = happyShift action_4
action_16 (8) = happyShift action_5
action_16 (10) = happyShift action_24
action_16 (11) = happyShift action_25
action_16 (12) = happyShift action_26
action_16 (13) = happyShift action_6
action_16 (16) = happyShift action_27
action_16 (17) = happyShift action_28
action_16 (18) = happyShift action_7
action_16 (20) = happyShift action_29
action_16 (21) = happyShift action_30
action_16 (22) = happyShift action_8
action_16 (23) = happyShift action_9
action_16 (27) = happyShift action_10
action_16 (29) = happyShift action_11
action_16 (31) = happyShift action_42
action_16 (32) = happyShift action_12
action_16 (33) = happyShift action_13
action_16 (34) = happyShift action_14
action_16 (4) = happyGoto action_23
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (6) = happyShift action_2
action_17 (7) = happyShift action_4
action_17 (8) = happyShift action_5
action_17 (18) = happyShift action_7
action_17 (22) = happyShift action_8
action_17 (29) = happyShift action_11
action_17 (32) = happyShift action_12
action_17 (34) = happyShift action_14
action_17 (4) = happyGoto action_23
action_17 _ = happyReduce_19

action_18 (19) = happyShift action_41
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (6) = happyShift action_2
action_19 (7) = happyShift action_4
action_19 (8) = happyShift action_5
action_19 (10) = happyShift action_24
action_19 (11) = happyShift action_25
action_19 (12) = happyShift action_26
action_19 (13) = happyShift action_6
action_19 (16) = happyShift action_27
action_19 (17) = happyShift action_28
action_19 (18) = happyShift action_7
action_19 (20) = happyShift action_29
action_19 (21) = happyShift action_30
action_19 (22) = happyShift action_8
action_19 (23) = happyShift action_9
action_19 (27) = happyShift action_10
action_19 (28) = happyShift action_40
action_19 (29) = happyShift action_11
action_19 (32) = happyShift action_12
action_19 (33) = happyShift action_13
action_19 (34) = happyShift action_14
action_19 (4) = happyGoto action_23
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (24) = happyShift action_39
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (6) = happyShift action_2
action_21 (7) = happyShift action_4
action_21 (8) = happyShift action_5
action_21 (18) = happyShift action_7
action_21 (22) = happyShift action_8
action_21 (29) = happyShift action_11
action_21 (32) = happyShift action_12
action_21 (34) = happyShift action_14
action_21 (4) = happyGoto action_23
action_21 _ = happyReduce_9

action_22 (6) = happyShift action_2
action_22 (7) = happyShift action_4
action_22 (8) = happyShift action_5
action_22 (10) = happyShift action_24
action_22 (11) = happyShift action_25
action_22 (12) = happyShift action_26
action_22 (13) = happyShift action_6
action_22 (14) = happyShift action_38
action_22 (16) = happyShift action_27
action_22 (17) = happyShift action_28
action_22 (18) = happyShift action_7
action_22 (20) = happyShift action_29
action_22 (21) = happyShift action_30
action_22 (22) = happyShift action_8
action_22 (23) = happyShift action_9
action_22 (27) = happyShift action_10
action_22 (29) = happyShift action_11
action_22 (32) = happyShift action_12
action_22 (33) = happyShift action_13
action_22 (34) = happyShift action_14
action_22 (4) = happyGoto action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (6) = happyShift action_2
action_23 (7) = happyShift action_4
action_23 (8) = happyShift action_5
action_23 (10) = happyShift action_24
action_23 (11) = happyShift action_25
action_23 (12) = happyShift action_26
action_23 (13) = happyShift action_6
action_23 (16) = happyShift action_27
action_23 (17) = happyShift action_28
action_23 (18) = happyShift action_7
action_23 (20) = happyShift action_29
action_23 (21) = happyShift action_30
action_23 (22) = happyShift action_8
action_23 (23) = happyShift action_9
action_23 (27) = happyShift action_10
action_23 (29) = happyShift action_11
action_23 (32) = happyShift action_12
action_23 (33) = happyShift action_13
action_23 (34) = happyShift action_14
action_23 (4) = happyGoto action_23
action_23 _ = happyReduce_14

action_24 (6) = happyShift action_2
action_24 (7) = happyShift action_4
action_24 (8) = happyShift action_5
action_24 (13) = happyShift action_6
action_24 (18) = happyShift action_7
action_24 (22) = happyShift action_8
action_24 (23) = happyShift action_9
action_24 (27) = happyShift action_10
action_24 (29) = happyShift action_11
action_24 (32) = happyShift action_12
action_24 (33) = happyShift action_13
action_24 (34) = happyShift action_14
action_24 (4) = happyGoto action_37
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (6) = happyShift action_2
action_25 (7) = happyShift action_4
action_25 (8) = happyShift action_5
action_25 (13) = happyShift action_6
action_25 (18) = happyShift action_7
action_25 (22) = happyShift action_8
action_25 (23) = happyShift action_9
action_25 (27) = happyShift action_10
action_25 (29) = happyShift action_11
action_25 (32) = happyShift action_12
action_25 (33) = happyShift action_13
action_25 (34) = happyShift action_14
action_25 (4) = happyGoto action_36
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (6) = happyShift action_2
action_26 (7) = happyShift action_4
action_26 (8) = happyShift action_5
action_26 (13) = happyShift action_6
action_26 (18) = happyShift action_7
action_26 (22) = happyShift action_8
action_26 (23) = happyShift action_9
action_26 (27) = happyShift action_10
action_26 (29) = happyShift action_11
action_26 (32) = happyShift action_12
action_26 (33) = happyShift action_13
action_26 (34) = happyShift action_14
action_26 (4) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (6) = happyShift action_2
action_27 (7) = happyShift action_4
action_27 (8) = happyShift action_5
action_27 (13) = happyShift action_6
action_27 (18) = happyShift action_7
action_27 (22) = happyShift action_8
action_27 (23) = happyShift action_9
action_27 (27) = happyShift action_10
action_27 (29) = happyShift action_11
action_27 (32) = happyShift action_12
action_27 (33) = happyShift action_13
action_27 (34) = happyShift action_14
action_27 (4) = happyGoto action_34
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (6) = happyShift action_2
action_28 (7) = happyShift action_4
action_28 (8) = happyShift action_5
action_28 (13) = happyShift action_6
action_28 (18) = happyShift action_7
action_28 (22) = happyShift action_8
action_28 (23) = happyShift action_9
action_28 (27) = happyShift action_10
action_28 (29) = happyShift action_11
action_28 (32) = happyShift action_12
action_28 (33) = happyShift action_13
action_28 (34) = happyShift action_14
action_28 (4) = happyGoto action_33
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (6) = happyShift action_2
action_29 (7) = happyShift action_4
action_29 (8) = happyShift action_5
action_29 (13) = happyShift action_6
action_29 (18) = happyShift action_7
action_29 (22) = happyShift action_8
action_29 (23) = happyShift action_9
action_29 (27) = happyShift action_10
action_29 (29) = happyShift action_11
action_29 (32) = happyShift action_12
action_29 (33) = happyShift action_13
action_29 (34) = happyShift action_14
action_29 (4) = happyGoto action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_2
action_30 (7) = happyShift action_4
action_30 (8) = happyShift action_5
action_30 (13) = happyShift action_6
action_30 (18) = happyShift action_7
action_30 (22) = happyShift action_8
action_30 (23) = happyShift action_9
action_30 (27) = happyShift action_10
action_30 (29) = happyShift action_11
action_30 (32) = happyShift action_12
action_30 (33) = happyShift action_13
action_30 (34) = happyShift action_14
action_30 (4) = happyGoto action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (6) = happyShift action_2
action_31 (7) = happyShift action_4
action_31 (8) = happyShift action_5
action_31 (10) = happyShift action_24
action_31 (11) = happyShift action_25
action_31 (12) = happyShift action_26
action_31 (16) = happyShift action_27
action_31 (17) = happyShift action_28
action_31 (18) = happyShift action_7
action_31 (22) = happyShift action_8
action_31 (29) = happyShift action_11
action_31 (32) = happyShift action_12
action_31 (34) = happyShift action_14
action_31 (4) = happyGoto action_23
action_31 _ = happyReduce_10

action_32 (6) = happyShift action_2
action_32 (7) = happyShift action_4
action_32 (8) = happyShift action_5
action_32 (10) = happyShift action_24
action_32 (11) = happyShift action_25
action_32 (12) = happyShift action_26
action_32 (16) = happyShift action_27
action_32 (17) = happyShift action_28
action_32 (18) = happyShift action_7
action_32 (22) = happyShift action_8
action_32 (29) = happyShift action_11
action_32 (32) = happyShift action_12
action_32 (34) = happyShift action_14
action_32 (4) = happyGoto action_23
action_32 _ = happyReduce_11

action_33 (6) = happyShift action_2
action_33 (7) = happyShift action_4
action_33 (8) = happyShift action_5
action_33 (18) = happyShift action_7
action_33 (22) = happyShift action_8
action_33 (29) = happyShift action_11
action_33 (32) = happyShift action_12
action_33 (34) = happyShift action_14
action_33 (4) = happyGoto action_23
action_33 _ = happyReduce_8

action_34 (6) = happyShift action_2
action_34 (7) = happyShift action_4
action_34 (8) = happyShift action_5
action_34 (18) = happyShift action_7
action_34 (22) = happyShift action_8
action_34 (29) = happyShift action_11
action_34 (32) = happyShift action_12
action_34 (34) = happyShift action_14
action_34 (4) = happyGoto action_23
action_34 _ = happyReduce_7

action_35 (6) = happyShift action_2
action_35 (7) = happyShift action_4
action_35 (8) = happyShift action_5
action_35 (16) = happyShift action_27
action_35 (17) = happyShift action_28
action_35 (18) = happyShift action_7
action_35 (22) = happyShift action_8
action_35 (29) = happyShift action_11
action_35 (32) = happyShift action_12
action_35 (34) = happyShift action_14
action_35 (4) = happyGoto action_23
action_35 _ = happyReduce_6

action_36 (6) = happyShift action_2
action_36 (7) = happyShift action_4
action_36 (8) = happyShift action_5
action_36 (12) = happyShift action_26
action_36 (16) = happyShift action_27
action_36 (17) = happyShift action_28
action_36 (18) = happyShift action_7
action_36 (22) = happyShift action_8
action_36 (29) = happyShift action_11
action_36 (32) = happyShift action_12
action_36 (34) = happyShift action_14
action_36 (4) = happyGoto action_23
action_36 _ = happyReduce_5

action_37 (6) = happyShift action_2
action_37 (7) = happyShift action_4
action_37 (8) = happyShift action_5
action_37 (12) = happyShift action_26
action_37 (16) = happyShift action_27
action_37 (17) = happyShift action_28
action_37 (18) = happyShift action_7
action_37 (22) = happyShift action_8
action_37 (29) = happyShift action_11
action_37 (32) = happyShift action_12
action_37 (34) = happyShift action_14
action_37 (4) = happyGoto action_23
action_37 _ = happyReduce_4

action_38 (6) = happyShift action_2
action_38 (7) = happyShift action_4
action_38 (8) = happyShift action_5
action_38 (13) = happyShift action_6
action_38 (18) = happyShift action_7
action_38 (22) = happyShift action_8
action_38 (23) = happyShift action_9
action_38 (27) = happyShift action_10
action_38 (29) = happyShift action_11
action_38 (32) = happyShift action_12
action_38 (33) = happyShift action_13
action_38 (34) = happyShift action_14
action_38 (4) = happyGoto action_49
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (25) = happyShift action_46
action_39 (26) = happyShift action_47
action_39 (27) = happyShift action_48
action_39 (5) = happyGoto action_45
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_16

action_41 (6) = happyShift action_2
action_41 (7) = happyShift action_4
action_41 (8) = happyShift action_5
action_41 (13) = happyShift action_6
action_41 (18) = happyShift action_7
action_41 (22) = happyShift action_8
action_41 (23) = happyShift action_9
action_41 (27) = happyShift action_10
action_41 (29) = happyShift action_11
action_41 (32) = happyShift action_12
action_41 (33) = happyShift action_13
action_41 (34) = happyShift action_14
action_41 (4) = happyGoto action_44
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (6) = happyShift action_2
action_42 (7) = happyShift action_4
action_42 (8) = happyShift action_5
action_42 (13) = happyShift action_6
action_42 (18) = happyShift action_7
action_42 (22) = happyShift action_8
action_42 (23) = happyShift action_9
action_42 (27) = happyShift action_10
action_42 (29) = happyShift action_11
action_42 (32) = happyShift action_12
action_42 (33) = happyShift action_13
action_42 (34) = happyShift action_14
action_42 (4) = happyGoto action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (6) = happyShift action_2
action_43 (7) = happyShift action_4
action_43 (8) = happyShift action_5
action_43 (10) = happyShift action_24
action_43 (11) = happyShift action_25
action_43 (12) = happyShift action_26
action_43 (13) = happyFail []
action_43 (16) = happyShift action_27
action_43 (17) = happyShift action_28
action_43 (18) = happyShift action_7
action_43 (20) = happyShift action_29
action_43 (21) = happyShift action_30
action_43 (22) = happyShift action_8
action_43 (23) = happyFail []
action_43 (27) = happyFail []
action_43 (29) = happyShift action_11
action_43 (32) = happyShift action_12
action_43 (33) = happyFail []
action_43 (34) = happyShift action_14
action_43 (4) = happyGoto action_23
action_43 _ = happyReduce_18

action_44 (6) = happyShift action_2
action_44 (7) = happyShift action_4
action_44 (8) = happyShift action_5
action_44 (10) = happyShift action_24
action_44 (11) = happyShift action_25
action_44 (12) = happyShift action_26
action_44 (13) = happyShift action_6
action_44 (16) = happyShift action_27
action_44 (17) = happyShift action_28
action_44 (18) = happyShift action_7
action_44 (20) = happyShift action_29
action_44 (21) = happyShift action_30
action_44 (22) = happyShift action_8
action_44 (23) = happyShift action_9
action_44 (27) = happyShift action_10
action_44 (29) = happyShift action_11
action_44 (30) = happyShift action_53
action_44 (32) = happyShift action_12
action_44 (33) = happyShift action_13
action_44 (34) = happyShift action_14
action_44 (4) = happyGoto action_23
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (9) = happyShift action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_21

action_47 _ = happyReduce_22

action_48 (25) = happyShift action_46
action_48 (26) = happyShift action_47
action_48 (27) = happyShift action_48
action_48 (5) = happyGoto action_51
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (6) = happyShift action_2
action_49 (7) = happyShift action_4
action_49 (8) = happyShift action_5
action_49 (10) = happyShift action_24
action_49 (11) = happyShift action_25
action_49 (12) = happyShift action_26
action_49 (13) = happyShift action_6
action_49 (15) = happyShift action_50
action_49 (16) = happyShift action_27
action_49 (17) = happyShift action_28
action_49 (18) = happyShift action_7
action_49 (20) = happyShift action_29
action_49 (21) = happyShift action_30
action_49 (22) = happyShift action_8
action_49 (23) = happyShift action_9
action_49 (27) = happyShift action_10
action_49 (29) = happyShift action_11
action_49 (32) = happyShift action_12
action_49 (33) = happyShift action_13
action_49 (34) = happyShift action_14
action_49 (4) = happyGoto action_23
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (6) = happyShift action_2
action_50 (7) = happyShift action_4
action_50 (8) = happyShift action_5
action_50 (13) = happyShift action_6
action_50 (18) = happyShift action_7
action_50 (22) = happyShift action_8
action_50 (23) = happyShift action_9
action_50 (27) = happyShift action_10
action_50 (29) = happyShift action_11
action_50 (32) = happyShift action_12
action_50 (33) = happyShift action_13
action_50 (34) = happyShift action_14
action_50 (4) = happyGoto action_57
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (9) = happyShift action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (6) = happyShift action_2
action_52 (7) = happyShift action_4
action_52 (8) = happyShift action_5
action_52 (13) = happyShift action_6
action_52 (18) = happyShift action_7
action_52 (22) = happyShift action_8
action_52 (23) = happyShift action_9
action_52 (27) = happyShift action_10
action_52 (29) = happyShift action_11
action_52 (32) = happyShift action_12
action_52 (33) = happyShift action_13
action_52 (34) = happyShift action_14
action_52 (4) = happyGoto action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (6) = happyShift action_2
action_53 (7) = happyShift action_4
action_53 (8) = happyShift action_5
action_53 (13) = happyShift action_6
action_53 (18) = happyShift action_7
action_53 (22) = happyShift action_8
action_53 (23) = happyShift action_9
action_53 (27) = happyShift action_10
action_53 (29) = happyShift action_11
action_53 (32) = happyShift action_12
action_53 (33) = happyShift action_13
action_53 (34) = happyShift action_14
action_53 (4) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (6) = happyShift action_2
action_54 (7) = happyShift action_4
action_54 (8) = happyShift action_5
action_54 (10) = happyShift action_24
action_54 (11) = happyShift action_25
action_54 (12) = happyShift action_26
action_54 (13) = happyShift action_6
action_54 (16) = happyShift action_27
action_54 (17) = happyShift action_28
action_54 (18) = happyShift action_7
action_54 (20) = happyShift action_29
action_54 (21) = happyShift action_30
action_54 (22) = happyShift action_8
action_54 (23) = happyShift action_9
action_54 (27) = happyShift action_10
action_54 (29) = happyShift action_11
action_54 (32) = happyShift action_12
action_54 (33) = happyShift action_13
action_54 (34) = happyShift action_14
action_54 (4) = happyGoto action_23
action_54 _ = happyReduce_17

action_55 (6) = happyShift action_2
action_55 (7) = happyShift action_4
action_55 (8) = happyShift action_5
action_55 (10) = happyShift action_24
action_55 (11) = happyShift action_25
action_55 (12) = happyShift action_26
action_55 (13) = happyFail []
action_55 (16) = happyShift action_27
action_55 (17) = happyShift action_28
action_55 (18) = happyShift action_7
action_55 (20) = happyShift action_29
action_55 (21) = happyShift action_30
action_55 (22) = happyShift action_8
action_55 (23) = happyFail []
action_55 (27) = happyFail []
action_55 (29) = happyShift action_11
action_55 (32) = happyShift action_12
action_55 (33) = happyFail []
action_55 (34) = happyShift action_14
action_55 (4) = happyGoto action_23
action_55 _ = happyReduce_13

action_56 (25) = happyShift action_46
action_56 (26) = happyShift action_47
action_56 (27) = happyShift action_48
action_56 (5) = happyGoto action_58
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (6) = happyShift action_2
action_57 (7) = happyShift action_4
action_57 (8) = happyShift action_5
action_57 (10) = happyShift action_24
action_57 (11) = happyShift action_25
action_57 (12) = happyShift action_26
action_57 (13) = happyFail []
action_57 (16) = happyShift action_27
action_57 (17) = happyShift action_28
action_57 (18) = happyShift action_7
action_57 (20) = happyShift action_29
action_57 (21) = happyShift action_30
action_57 (22) = happyShift action_8
action_57 (23) = happyFail []
action_57 (27) = happyFail []
action_57 (29) = happyShift action_11
action_57 (32) = happyShift action_12
action_57 (33) = happyFail []
action_57 (34) = happyShift action_14
action_57 (4) = happyGoto action_23
action_57 _ = happyReduce_12

action_58 (28) = happyShift action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_23

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (Token_Num happy_var_1))
	 =  HappyAbsSyn4
		 (Num happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 _
	 =  HappyAbsSyn4
		 (BTrue
	)

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn4
		 (BFalse
	)

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Add happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  4 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  4 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  4 happyReduction_9
happyReduction_9 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Not happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  4 happyReduction_10
happyReduction_10 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  4 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Geq happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happyReduce 6 4 happyReduction_12
happyReduction_12 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 6 4 happyReduction_13
happyReduction_13 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token_Var happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Lam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  4 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  4 happyReduction_15
happyReduction_15 (HappyTerminal (Token_Var happy_var_1))
	 =  HappyAbsSyn4
		 (Var happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Paren happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 6 4 happyReduction_17
happyReduction_17 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token_Var happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 4 4 happyReduction_18
happyReduction_18 ((HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Try happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Raise happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  4 happyReduction_20
happyReduction_20 (HappyTerminal (Token_Num happy_var_2))
	_
	 =  HappyAbsSyn4
		 (Error happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  5 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn5
		 (TNum
	)

happyReduce_22 = happySpecReduce_1  5 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn5
		 (TBool
	)

happyReduce_23 = happyReduce 5 5 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TFun happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Token_Num happy_dollar_dollar -> cont 6;
	Token_True -> cont 7;
	Token_False -> cont 8;
	Token_Seta -> cont 9;
	Token_Add -> cont 10;
	Token_Sub -> cont 11;
	Token_Mul -> cont 12;
	Token_If -> cont 13;
	Token_Then -> cont 14;
	Token_Else -> cont 15;
	Token_And -> cont 16;
	Token_Or -> cont 17;
	Token_Not -> cont 18;
	Token_Atb -> cont 19;
	Token_Geq -> cont 20;
	Token_Eq -> cont 21;
	Token_Var happy_dollar_dollar -> cont 22;
	Token_Lam -> cont 23;
	Token_Colon -> cont 24;
	Token_TNum -> cont 25;
	Token_TBool -> cont 26;
	Token_Lparen -> cont 27;
	Token_Rparen -> cont 28;
	Token_Let -> cont 29;
	Token_In -> cont 30;
	Token_With -> cont 31;
	Token_Raise -> cont 32;
	Token_Try -> cont 33;
	Token_Error -> cont 34;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 35 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Erro sintático!"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
