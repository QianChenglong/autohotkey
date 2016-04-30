/*
 HotString Documentation: http://ahkscript.org/docs/Hotstrings.htm

 Examples:

 Single Line
 ::btw::by the way
 
 Multi-Line
 ::btw::
     MsgBox You typed "btw".
  Return
*/

#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t

; * (星号): 不需要结束字符(比如空格、句点或回车)来触发热字符串

:*:/yx::qian_cheng_long@163.com
:*:/id::342501198812014054
:*:/xx::西南科技大学
:*:/zy::计算机科学与技术
:*:/sj::13691615072
:*:/rq::
d = %A_YYYY%-%A_MM%-%A_DD%
clipboard = %d%
Send ^v
return
