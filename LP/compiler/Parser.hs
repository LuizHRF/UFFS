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
happyExpList = Happy_Data_Array.listArray (0,388) ([4320,37986,259,0,0,0,49152,63293,1832,0,0,0,0,17280,20872,7182,35906,114,0,0,0,1,33848,58648,0,64,3584,17953,28729,12552,458,0,0,29660,31375,0,36898,0,32,47104,7911,231,0,1,8192,2306,57200,51773,1,0,7168,35906,57458,25104,916,4231,7331,33848,58648,8640,10436,3591,17953,28729,12552,458,36408,576,29120,4612,0,36898,0,33040,4,2272,36,18192,288,14464,2306,2160,51761,1,7168,0,0,57344,25104,916,4231,7331,58240,9230,15808,26871,4103,0,0,0,0,0,0,0,224,57056,38011,34563,41744,16412,0,49152,50209,1832,8462,14662,0,0,14336,16622,2,57344,0,15246,144,0,64,0,0,0,0
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
action_3 (10) = happyShift action_23
action_3 (11) = happyShift action_24
action_3 (12) = happyShift action_25
action_3 (13) = happyShift action_6
action_3 (16) = happyShift action_26
action_3 (17) = happyShift action_27
action_3 (18) = happyShift action_7
action_3 (20) = happyShift action_28
action_3 (21) = happyShift action_29
action_3 (22) = happyShift action_8
action_3 (23) = happyShift action_9
action_3 (27) = happyShift action_10
action_3 (29) = happyShift action_11
action_3 (32) = happyShift action_12
action_3 (33) = happyShift action_13
action_3 (34) = happyShift action_14
action_3 (35) = happyAccept
action_3 (4) = happyGoto action_22
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
action_6 (4) = happyGoto action_21
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
action_7 (4) = happyGoto action_20
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_15

action_9 (22) = happyShift action_19
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
action_10 (4) = happyGoto action_18
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (22) = happyShift action_17
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
action_12 (4) = happyGoto action_16
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
action_13 (4) = happyGoto action_15
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_20

action_15 (6) = happyShift action_2
action_15 (7) = happyShift action_4
action_15 (8) = happyShift action_5
action_15 (10) = happyShift action_23
action_15 (11) = happyShift action_24
action_15 (12) = happyShift action_25
action_15 (13) = happyShift action_6
action_15 (16) = happyShift action_26
action_15 (17) = happyShift action_27
action_15 (18) = happyShift action_7
action_15 (20) = happyShift action_28
action_15 (21) = happyShift action_29
action_15 (22) = happyShift action_8
action_15 (23) = happyShift action_9
action_15 (27) = happyShift action_10
action_15 (29) = happyShift action_11
action_15 (31) = happyShift action_41
action_15 (32) = happyShift action_12
action_15 (33) = happyShift action_13
action_15 (34) = happyShift action_14
action_15 (4) = happyGoto action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (6) = happyShift action_2
action_16 (7) = happyShift action_4
action_16 (8) = happyShift action_5
action_16 (18) = happyShift action_7
action_16 (22) = happyShift action_8
action_16 (29) = happyShift action_11
action_16 (32) = happyShift action_12
action_16 (4) = happyGoto action_22
action_16 _ = happyReduce_19

action_17 (19) = happyShift action_40
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (6) = happyShift action_2
action_18 (7) = happyShift action_4
action_18 (8) = happyShift action_5
action_18 (10) = happyShift action_23
action_18 (11) = happyShift action_24
action_18 (12) = happyShift action_25
action_18 (13) = happyShift action_6
action_18 (16) = happyShift action_26
action_18 (17) = happyShift action_27
action_18 (18) = happyShift action_7
action_18 (20) = happyShift action_28
action_18 (21) = happyShift action_29
action_18 (22) = happyShift action_8
action_18 (23) = happyShift action_9
action_18 (27) = happyShift action_10
action_18 (28) = happyShift action_39
action_18 (29) = happyShift action_11
action_18 (32) = happyShift action_12
action_18 (33) = happyShift action_13
action_18 (34) = happyShift action_14
action_18 (4) = happyGoto action_22
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (24) = happyShift action_38
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (6) = happyShift action_2
action_20 (7) = happyShift action_4
action_20 (8) = happyShift action_5
action_20 (18) = happyShift action_7
action_20 (22) = happyShift action_8
action_20 (29) = happyShift action_11
action_20 (32) = happyShift action_12
action_20 (4) = happyGoto action_22
action_20 _ = happyReduce_9

action_21 (6) = happyShift action_2
action_21 (7) = happyShift action_4
action_21 (8) = happyShift action_5
action_21 (10) = happyShift action_23
action_21 (11) = happyShift action_24
action_21 (12) = happyShift action_25
action_21 (13) = happyShift action_6
action_21 (14) = happyShift action_37
action_21 (16) = happyShift action_26
action_21 (17) = happyShift action_27
action_21 (18) = happyShift action_7
action_21 (20) = happyShift action_28
action_21 (21) = happyShift action_29
action_21 (22) = happyShift action_8
action_21 (23) = happyShift action_9
action_21 (27) = happyShift action_10
action_21 (29) = happyShift action_11
action_21 (32) = happyShift action_12
action_21 (33) = happyShift action_13
action_21 (34) = happyShift action_14
action_21 (4) = happyGoto action_22
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (6) = happyShift action_2
action_22 (7) = happyShift action_4
action_22 (8) = happyShift action_5
action_22 (10) = happyShift action_23
action_22 (11) = happyShift action_24
action_22 (12) = happyShift action_25
action_22 (13) = happyShift action_6
action_22 (16) = happyShift action_26
action_22 (17) = happyShift action_27
action_22 (18) = happyShift action_7
action_22 (20) = happyShift action_28
action_22 (21) = happyShift action_29
action_22 (22) = happyShift action_8
action_22 (23) = happyShift action_9
action_22 (27) = happyShift action_10
action_22 (29) = happyShift action_11
action_22 (32) = happyShift action_12
action_22 (33) = happyShift action_13
action_22 (34) = happyShift action_14
action_22 (4) = happyGoto action_22
action_22 _ = happyReduce_14

action_23 (6) = happyShift action_2
action_23 (7) = happyShift action_4
action_23 (8) = happyShift action_5
action_23 (13) = happyShift action_6
action_23 (18) = happyShift action_7
action_23 (22) = happyShift action_8
action_23 (23) = happyShift action_9
action_23 (27) = happyShift action_10
action_23 (29) = happyShift action_11
action_23 (32) = happyShift action_12
action_23 (33) = happyShift action_13
action_23 (34) = happyShift action_14
action_23 (4) = happyGoto action_36
action_23 _ = happyFail (happyExpListPerState 23)

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
action_24 (4) = happyGoto action_35
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
action_25 (4) = happyGoto action_34
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
action_26 (4) = happyGoto action_33
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
action_27 (4) = happyGoto action_32
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
action_28 (4) = happyGoto action_31
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
action_29 (4) = happyGoto action_30
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (6) = happyShift action_2
action_30 (7) = happyShift action_4
action_30 (8) = happyShift action_5
action_30 (10) = happyShift action_23
action_30 (11) = happyShift action_24
action_30 (12) = happyShift action_25
action_30 (16) = happyShift action_26
action_30 (17) = happyShift action_27
action_30 (18) = happyShift action_7
action_30 (22) = happyShift action_8
action_30 (29) = happyShift action_11
action_30 (32) = happyShift action_12
action_30 (4) = happyGoto action_22
action_30 _ = happyReduce_10

action_31 (6) = happyShift action_2
action_31 (7) = happyShift action_4
action_31 (8) = happyShift action_5
action_31 (10) = happyShift action_23
action_31 (11) = happyShift action_24
action_31 (12) = happyShift action_25
action_31 (16) = happyShift action_26
action_31 (17) = happyShift action_27
action_31 (18) = happyShift action_7
action_31 (22) = happyShift action_8
action_31 (29) = happyShift action_11
action_31 (32) = happyShift action_12
action_31 (4) = happyGoto action_22
action_31 _ = happyReduce_11

action_32 (6) = happyShift action_2
action_32 (7) = happyShift action_4
action_32 (8) = happyShift action_5
action_32 (18) = happyShift action_7
action_32 (22) = happyShift action_8
action_32 (29) = happyShift action_11
action_32 (32) = happyShift action_12
action_32 (4) = happyGoto action_22
action_32 _ = happyReduce_8

action_33 (6) = happyShift action_2
action_33 (7) = happyShift action_4
action_33 (8) = happyShift action_5
action_33 (18) = happyShift action_7
action_33 (22) = happyShift action_8
action_33 (29) = happyShift action_11
action_33 (32) = happyShift action_12
action_33 (4) = happyGoto action_22
action_33 _ = happyReduce_7

action_34 (6) = happyShift action_2
action_34 (7) = happyShift action_4
action_34 (8) = happyShift action_5
action_34 (16) = happyShift action_26
action_34 (17) = happyShift action_27
action_34 (18) = happyShift action_7
action_34 (22) = happyShift action_8
action_34 (29) = happyShift action_11
action_34 (32) = happyShift action_12
action_34 (4) = happyGoto action_22
action_34 _ = happyReduce_6

action_35 (6) = happyShift action_2
action_35 (7) = happyShift action_4
action_35 (8) = happyShift action_5
action_35 (12) = happyShift action_25
action_35 (16) = happyShift action_26
action_35 (17) = happyShift action_27
action_35 (18) = happyShift action_7
action_35 (22) = happyShift action_8
action_35 (29) = happyShift action_11
action_35 (32) = happyShift action_12
action_35 (4) = happyGoto action_22
action_35 _ = happyReduce_5

action_36 (6) = happyShift action_2
action_36 (7) = happyShift action_4
action_36 (8) = happyShift action_5
action_36 (12) = happyShift action_25
action_36 (16) = happyShift action_26
action_36 (17) = happyShift action_27
action_36 (18) = happyShift action_7
action_36 (22) = happyShift action_8
action_36 (29) = happyShift action_11
action_36 (32) = happyShift action_12
action_36 (4) = happyGoto action_22
action_36 _ = happyReduce_4

action_37 (6) = happyShift action_2
action_37 (7) = happyShift action_4
action_37 (8) = happyShift action_5
action_37 (13) = happyShift action_6
action_37 (18) = happyShift action_7
action_37 (22) = happyShift action_8
action_37 (23) = happyShift action_9
action_37 (27) = happyShift action_10
action_37 (29) = happyShift action_11
action_37 (32) = happyShift action_12
action_37 (33) = happyShift action_13
action_37 (34) = happyShift action_14
action_37 (4) = happyGoto action_48
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (25) = happyShift action_45
action_38 (26) = happyShift action_46
action_38 (27) = happyShift action_47
action_38 (5) = happyGoto action_44
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_16

action_40 (6) = happyShift action_2
action_40 (7) = happyShift action_4
action_40 (8) = happyShift action_5
action_40 (13) = happyShift action_6
action_40 (18) = happyShift action_7
action_40 (22) = happyShift action_8
action_40 (23) = happyShift action_9
action_40 (27) = happyShift action_10
action_40 (29) = happyShift action_11
action_40 (32) = happyShift action_12
action_40 (33) = happyShift action_13
action_40 (34) = happyShift action_14
action_40 (4) = happyGoto action_43
action_40 _ = happyFail (happyExpListPerState 40)

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
action_41 (4) = happyGoto action_42
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (6) = happyShift action_2
action_42 (7) = happyShift action_4
action_42 (8) = happyShift action_5
action_42 (10) = happyShift action_23
action_42 (11) = happyShift action_24
action_42 (12) = happyShift action_25
action_42 (13) = happyFail []
action_42 (16) = happyShift action_26
action_42 (17) = happyShift action_27
action_42 (18) = happyShift action_7
action_42 (20) = happyShift action_28
action_42 (21) = happyShift action_29
action_42 (22) = happyShift action_8
action_42 (23) = happyFail []
action_42 (27) = happyFail []
action_42 (29) = happyShift action_11
action_42 (32) = happyShift action_12
action_42 (33) = happyFail []
action_42 (34) = happyFail []
action_42 (4) = happyGoto action_22
action_42 _ = happyReduce_18

action_43 (6) = happyShift action_2
action_43 (7) = happyShift action_4
action_43 (8) = happyShift action_5
action_43 (10) = happyShift action_23
action_43 (11) = happyShift action_24
action_43 (12) = happyShift action_25
action_43 (13) = happyShift action_6
action_43 (16) = happyShift action_26
action_43 (17) = happyShift action_27
action_43 (18) = happyShift action_7
action_43 (20) = happyShift action_28
action_43 (21) = happyShift action_29
action_43 (22) = happyShift action_8
action_43 (23) = happyShift action_9
action_43 (27) = happyShift action_10
action_43 (29) = happyShift action_11
action_43 (30) = happyShift action_52
action_43 (32) = happyShift action_12
action_43 (33) = happyShift action_13
action_43 (34) = happyShift action_14
action_43 (4) = happyGoto action_22
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (9) = happyShift action_51
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_21

action_46 _ = happyReduce_22

action_47 (25) = happyShift action_45
action_47 (26) = happyShift action_46
action_47 (27) = happyShift action_47
action_47 (5) = happyGoto action_50
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (6) = happyShift action_2
action_48 (7) = happyShift action_4
action_48 (8) = happyShift action_5
action_48 (10) = happyShift action_23
action_48 (11) = happyShift action_24
action_48 (12) = happyShift action_25
action_48 (13) = happyShift action_6
action_48 (15) = happyShift action_49
action_48 (16) = happyShift action_26
action_48 (17) = happyShift action_27
action_48 (18) = happyShift action_7
action_48 (20) = happyShift action_28
action_48 (21) = happyShift action_29
action_48 (22) = happyShift action_8
action_48 (23) = happyShift action_9
action_48 (27) = happyShift action_10
action_48 (29) = happyShift action_11
action_48 (32) = happyShift action_12
action_48 (33) = happyShift action_13
action_48 (34) = happyShift action_14
action_48 (4) = happyGoto action_22
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (6) = happyShift action_2
action_49 (7) = happyShift action_4
action_49 (8) = happyShift action_5
action_49 (13) = happyShift action_6
action_49 (18) = happyShift action_7
action_49 (22) = happyShift action_8
action_49 (23) = happyShift action_9
action_49 (27) = happyShift action_10
action_49 (29) = happyShift action_11
action_49 (32) = happyShift action_12
action_49 (33) = happyShift action_13
action_49 (34) = happyShift action_14
action_49 (4) = happyGoto action_56
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (9) = happyShift action_55
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (6) = happyShift action_2
action_51 (7) = happyShift action_4
action_51 (8) = happyShift action_5
action_51 (13) = happyShift action_6
action_51 (18) = happyShift action_7
action_51 (22) = happyShift action_8
action_51 (23) = happyShift action_9
action_51 (27) = happyShift action_10
action_51 (29) = happyShift action_11
action_51 (32) = happyShift action_12
action_51 (33) = happyShift action_13
action_51 (34) = happyShift action_14
action_51 (4) = happyGoto action_54
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
action_52 (4) = happyGoto action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (6) = happyShift action_2
action_53 (7) = happyShift action_4
action_53 (8) = happyShift action_5
action_53 (10) = happyShift action_23
action_53 (11) = happyShift action_24
action_53 (12) = happyShift action_25
action_53 (13) = happyShift action_6
action_53 (16) = happyShift action_26
action_53 (17) = happyShift action_27
action_53 (18) = happyShift action_7
action_53 (20) = happyShift action_28
action_53 (21) = happyShift action_29
action_53 (22) = happyShift action_8
action_53 (23) = happyShift action_9
action_53 (27) = happyShift action_10
action_53 (29) = happyShift action_11
action_53 (32) = happyShift action_12
action_53 (33) = happyShift action_13
action_53 (34) = happyShift action_14
action_53 (4) = happyGoto action_22
action_53 _ = happyReduce_17

action_54 (6) = happyShift action_2
action_54 (7) = happyShift action_4
action_54 (8) = happyShift action_5
action_54 (10) = happyShift action_23
action_54 (11) = happyShift action_24
action_54 (12) = happyShift action_25
action_54 (13) = happyFail []
action_54 (16) = happyShift action_26
action_54 (17) = happyShift action_27
action_54 (18) = happyShift action_7
action_54 (20) = happyShift action_28
action_54 (21) = happyShift action_29
action_54 (22) = happyShift action_8
action_54 (23) = happyFail []
action_54 (27) = happyFail []
action_54 (29) = happyShift action_11
action_54 (32) = happyShift action_12
action_54 (33) = happyFail []
action_54 (34) = happyFail []
action_54 (4) = happyGoto action_22
action_54 _ = happyReduce_13

action_55 (25) = happyShift action_45
action_55 (26) = happyShift action_46
action_55 (27) = happyShift action_47
action_55 (5) = happyGoto action_57
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (6) = happyShift action_2
action_56 (7) = happyShift action_4
action_56 (8) = happyShift action_5
action_56 (10) = happyShift action_23
action_56 (11) = happyShift action_24
action_56 (12) = happyShift action_25
action_56 (13) = happyFail []
action_56 (16) = happyShift action_26
action_56 (17) = happyShift action_27
action_56 (18) = happyShift action_7
action_56 (20) = happyShift action_28
action_56 (21) = happyShift action_29
action_56 (22) = happyShift action_8
action_56 (23) = happyFail []
action_56 (27) = happyFail []
action_56 (29) = happyShift action_11
action_56 (32) = happyShift action_12
action_56 (33) = happyFail []
action_56 (34) = happyFail []
action_56 (4) = happyGoto action_22
action_56 _ = happyReduce_12

action_57 (28) = happyShift action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_23

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

happyReduce_20 = happySpecReduce_1  4 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn4
		 (Error
	)

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
