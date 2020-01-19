%% Based on canonical data version 1.5.0
%% https://github.com/exercism/problem-specifications/raw/master/exercises/bracket-push/canonical-data.json
%% This file is automatically generated from the exercises canonical data.

-module(bracket_push_tests).

-include_lib("erl_exercism/include/exercism.hrl").
-include_lib("eunit/include/eunit.hrl").




'1_paired_square_brackets_test'() ->
    ?assert(bracket_push:is_paired("[]")).

'2_empty_string_test'() ->
    ?assert(bracket_push:is_paired([])).

'3_unpaired_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("[[")).

'4_wrong_ordered_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("}{")).

'5_wrong_closing_bracket_test'() ->
    ?assertNot(bracket_push:is_paired("{]")).

'6_paired_with_whitespace_test'() ->
    ?assert(bracket_push:is_paired("{ }")).

'7_partially_paired_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("{[])")).

'8_simple_nested_brackets_test'() ->
    ?assert(bracket_push:is_paired("{[]}")).

'9_several_paired_brackets_test'() ->
    ?assert(bracket_push:is_paired("{}[]")).

'10_paired_and_nested_brackets_test'() ->
    ?assert(bracket_push:is_paired("([{}({}[])])")).

'11_unopened_closing_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("{[)][]}")).

'12_unpaired_and_nested_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("([{])")).

'13_paired_and_wrong_nested_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("[({]})")).

'14_paired_and_incomplete_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("{}[")).

'15_too_many_closing_brackets_test'() ->
    ?assertNot(bracket_push:is_paired("[]]")).

'16_math_expression_test'() ->
    ?assert(bracket_push:is_paired("(((185 + 223.85) * 15) - 543)/2")).

'17_complex_latex_expression_test'() ->
    ?assert(bracket_push:is_paired("\\left(\\begin{array}{cc} \\frac{1}{3} "
				   "& x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\"
				   "right)")).
