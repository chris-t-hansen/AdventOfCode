HAI 1.4

CAN HAS STRING?
CAN HAS STDIO?

BTW Set a varaiable with the name of the input file
I HAS A InputFile ITZ "01-input.txt"

BTW Open file for reading
I HAS A FileNaym ITZ I IZ STDIO'Z OPEN YR InputFile AN YR "r" MKAY
I IZ STDIO'Z DIAF YR FileNaym MKAY
O RLY?
  YA RLY
    VISIBLE "FAILD! WER IZ TEH FILE :{InputFile}?"
  NO WAI
    VISIBLE "WINNR! OPEND :{InputFile} 4 READIN"
OIC

OBTW
  Read the file we loaded into a variable.
  Need to read at least 4000 bytes for the input file
  Then close the file.
TLDR
I HAS A InputVal ITZ I IZ STDIO'Z LUK YR FileNaym AN YR 4000 MKAY
I IZ STDIO'Z CLOSE YR FileNaym MKAY

BTW Get length of the input value
I HAS A InputValLen ITZ I IZ STRING'Z LEN YR InputVal MKAY
BTW Increase the length by 1 so we can capture the end of the file
InputValLen R SUM OF InputValLen AN 1

BTW VISIBLE InputValLen

BTW Set up array to store the individual numbers and a pointer to keep track of the current position in the array
I HAS A NumbrzList ITZ A BUKKIT
I HAS A NumbrzListPointr ITZ 0

OBTW
  Set up variables to loop through the characters read from the file
  Start at -1 since we sart by incrementing it by 1
TLDR
I HAS A PointrVal ITZ -1
BTW Create a variable to build the number, character by character
I HAS A CharYarn ITZ A YARN

OBTW
  Numbers will be read in as strings (YARNs in LOLCODE)
  This function will convert those strings to numbers
TLDR
HOW IZ I NumbrConvertr YR arg
  I HAS A ReturnNumbr ITZ MAEK arg A NUMBR
  FOUND YR ReturnNumbr
IF U SAY SO

BTW Loop through the InputVal one character at a time
IM IN YR InputValLoop UPPIN YR Charactr TIL BOTH SAEM PointrVal AN InputValLen
  BTW Increment PointrVal
  PointrVal R SUM OF PointrVal AN 1
  BTW Get the character from input at the current index pointer
  I HAS A char ITZ I IZ STRING'Z AT YR InputVal AN YR PointrVal MKAY
  BTW Check for new line character (In LOLCODE, that is a :)
  BTW Also check for end of file by checking if the current index pointer is the same as the length of the input + 1
  ANY OF BOTH SAEM char AN ":)" AN BOTH SAEM PointrVal AN InputValLen MKAY
  O RLY?
    YA RLY
      BTW Use the NumbrConvertr function to convert the CharYarn string value to a number
      I HAS A CharNum ITZ I IZ NumbrConvertr YR CharYarn MKAY
      BTW Put the converted number into the NumbrzList Array (BUKKIT) at the index value of NumbrzListPointr
      NumbrzList HAS A SRS NumbrzListPointr ITZ CharNum
      BTW Reset the CharYarn to an empty string
      CharYarn R ""
      BTW Increment the NumbrzListPointr by 1
      NumbrzListPointr R SUM OF NumbrzListPointr AN 1
    NO WAI
      BTW The input values are read in character by character so we Concat them (SMOOSH) to form the actual numbers in between new line characters
      CharYarn R SMOOSH CharYarn AN char MKAY
  OIC
IM OUTTA YR InputValLoop

OBTW
  Create some variables for checking the modulo of each value in the NumbrzList Array to determine if it is even or odd
  Create variables to store the even and odd values
TLDR
I HAS A CurrentNumbr ITZ A NUMBR
I HAS A ModChek ITZ A TROOF
I HAS A PositivNumbrAddishun ITZ 0
I HAS A NegativNumbrAddishun ITZ 0

OBTW
  Loop through the array and determine if each number is even or odd
  If even, add the value to PositivNumbrAddishun
  If odd, add the value to NegativNumbrAddishun
TLDR
IM IN YR NumbrzListLoop UPPIN YR Index TIL BOTH SAEM Index AN NumbrzListPointr
  BTW Get the array value from the index at NumbrzListPointr
  CurrentNumbr R NumbrzList'Z SRS Index
  OBTW
    Use a comparison to store the result of the number mod 2
    The result is stored as a BOOLEAN (TROOF)
    i.e. If the mod 2 is 0, TROOF will have a value of WIN. Otherwise it will have a value of FAIL
  TLDR
  ModChek R BOTH SAEM MOD OF CurrentNumbr AN 2 AN 0
  BTW Using a Switch statement (WTF?) instead of an if (BOTH SAME) just to try it out.
  ModChek, WTF?
    OMG WIN
      PositivNumbrAddishun R SUM OF PositivNumbrAddishun AN CurrentNumbr
      GTFO
    OMG FAIL
      NegativNumbrAddishun R SUM OF NegativNumbrAddishun AN CurrentNumbr
      GTFO
  OIC
IM OUTTA YR NumbrzListLoop

BTW Print the final answer which is total of negative values minus the total of positive values
VISIBLE SMOOSH "TEH ANZWR 2 TEH PROBLEM IZ " AN DIFF OF NegativNumbrAddishun AN PositivNumbrAddishun MKAY

KTHXBYE
